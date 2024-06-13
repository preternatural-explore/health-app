//
//  FoodCell.swift
//  HealthApp
//
//  Created by Jared Davidson on 3/11/24.
//

import Foundation
import SwiftUI

struct MealCell: View {
    var meal: Meal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            mealImageView
            descriptiveSection(title: meal.name, content: nil, titleStyle: .title2)
            tagsView
            descriptiveSection(title: "Summary", content: meal.description)
            descriptiveSection(title: "Pros", content: meal.pros.first ?? "")
            descriptiveSection(title: "Cons", content: meal.cons.first ?? "")
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .padding()
    }
    
    var mealImageView: some View {
        Image(uiImage: meal.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .clipShape(Rectangle())
    }
    
    func descriptiveSection(title: String, content: String?, titleStyle: Font.TextStyle = .title3) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.horizontal)
            
            if let content = content {
                Text(content)
                    .font(.body)
                    .padding(.horizontal)
            }
        }
    }
    
    var tagsView: some View {
        let layout = [
            GridItem(.adaptive(minimum: 100, maximum: 200))
        ]
        
        return LazyVGrid(columns: layout, spacing: 5) {
            ForEach(meal.tags, id: \.self) { tag in
                tagView(tag: tag)
            }
        }
    }
    
    func tagView(tag: String) -> some View {
        Text(tag)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.orange))
            .foregroundColor(.primary)
            .font(.caption)
            .fixedSize(horizontal: true, vertical: false)
    }
}
