//
//  MealController.swift
//  HealthApp
//
//  Created by Jared Davidson on 3/11/24.
//

import Foundation
import SwiftUI
import AI

@MainActor
class MealController: ObservableObject {
    
    // Published properties to observe changes in the meal's status and the current image.
    @Published var mealStatus: MealStatus? = nil
    @Published var currentImage: UIImage? = nil
    
    // OpenAI client for sending requests.
    private let openAIClient = OpenAI.Client(apiKey: "YOUR_API_KEY") // Hide or replace your API key in real code for security
    //    #error("Please enter your OpenAI API Key")
    private let llmModel = OpenAI.Model.gpt_4o
    private let parameters = AbstractLLM.ChatCompletionParameters(
        tokenLimit: .fixed(1000)
    )
    
    // Initializes the MealController and registers the OpenAI client.
    init() {

    }
    
    // Asynchronously creates a meal object from an image.
    @MainActor
    func createMeal(image: UIImage) async throws -> Meal? {
        // Compress and update the image for processing.
        guard let data = image.jpegData(compressionQuality: 0.3),
              let compressedImage = UIImage(data: data) else { return nil }
        
        self.currentImage = compressedImage
        self.mealStatus = .uploading // Update status to uploading
        
        // Check if the image is of a meal.
        let isFood = try await getIfMeal(image: image)
        guard isFood else {
            self.mealStatus = .failure // Set status to failure if not a meal
            return nil
        }
        
        self.mealStatus = .analyzing // Update status to analyzing
        
        // Asynchronously obtain meal details from the image.
        async let mealName: String = try await processPrompt(with: image, prompt: Prompts.mealNamePrompt)
        async let mealComponents: String = try await processPrompt(with: image, prompt: Prompts.mealComponentsPrompt)
        async let mealDescription: String = try await processPrompt(with: image, prompt: Prompts.mealDescriptionPrompt)
        async let mealPros: String = try await processPrompt(with: image, prompt: Prompts.mealProsPrompt)
        async let mealCons: String = try await processPrompt(with: image, prompt: Prompts.mealConsPrompt)
        async let mealTags: String = try await processPrompt(with: image, prompt: Prompts.mealTagsPrompt)
        
        
        let mealTagsString = try await mealTags
        let mealTagsArray = mealTagsString.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
        // Construct and return the Meal object.
        let meal = Meal(
            name: try await mealName,
            components: try await [mealComponents],
            description: try await mealDescription,
            pros: try await [mealPros],
            cons: try await [mealCons],
            tags: mealTagsArray,
            image: image
        )
        
        self.mealStatus = .complete // Update status to complete
        self.currentImage = nil // Clear the current image
        return meal
    }
    
    // Determines whether an image represents a meal.
    private func getIfMeal(image: UIImage) async throws -> Bool {
        let imageLiteral = try PromptLiteral(image: image)
        let messages: [AbstractLLM.ChatMessage] = [
            .user {
                .concatenate(separator: nil) {
                    PromptLiteral(Prompts.isThisAMealPrompt)
                    imageLiteral
                }
            }
        ]
        
        let text: String = try await openAIClient.complete(
                messages,
                parameters: parameters,
                model: llmModel,
                as: .string)
        
        return Bool(text) ?? false
    }
    
    // Helper function to process a prompt with an image.
    private func processPrompt(with image: UIImage, prompt: String) async throws -> String {
        let imageLiteral = try PromptLiteral(image: image)
        let messages: [AbstractLLM.ChatMessage] = [
            .user {
                .concatenate(separator: nil) {
                    PromptLiteral(prompt)
                    imageLiteral
                }
            }
        ]
        
        // Request and process the response from the OpenAI service.
        let text: String = try await openAIClient.complete(
                messages,
                parameters: parameters,
                model: llmModel,
                as: .string)
        
        return text
    }
}
