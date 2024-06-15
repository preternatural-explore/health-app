> [!IMPORTANT]
> Created by [Preternatural AI](https://preternatural.ai/), an exhaustive client-side AI infrastructure for Swift.<br/>
> This project and the frameworks used are presently in alpha stage of development.

# HealthApp: Nutritional Insight from Food Photos
A simple app to upload an image to OpenAI Vision for analysis. If the item is food we will gather the pros, cons, type & overall summary about the food.
<br/><br/>
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/PreternaturalAI/AI/blob/main/LICENSE)

## Table of Contents
- [Usage](#usage)
- [Key Concepts](#key-concepts)
- [Preternatural Frameworks](#preternatural-frameworks)
- [License](#license)

## Usage
#### Supported Platforms

<!--iPhone-->
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ios.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ios-active.svg">
  <img alt="ios" src="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ios-active.svg" height="24">
</picture>&nbsp;

<!-- iPad-->
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ipados.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ipados-active.svg">
  <img alt="ipados" src="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ipados-active.svg" height="24">
</picture>&nbsp;

</p>
To install and run HealthApp:<br/>
1. Download and open the project<br/>
2. Add your OpenAI API Key in the `MealController` file:<br/>

```swift
// MealController
private let openAIClient = OpenAI.Client(apiKey: "YOUR_API_KEY")
```
*You can get the OpenAI API key on the [OpenAI developer website](https://platform.openai.com/). Note that you have to set up billing and add a small amount of money for the API calls to work (this will cost you less than 1 dollar).* 

3. Run the project on your iPhone. Note that you'll need to use the Camera, so run on device.
4. Take a picture of your food to get the health details: 

https://github.com/preternatural-explore/health-app/blob/main/313036265-c294c3e1-ec6b-4118-9ac1-cdedeaef074b.mov

*Note: Subscription handling needs more logic to work as intended.

## Key Concepts
The HealthApp is developed to demonstrate the the following key concepts:

- Using OpenAI's Vision API for photo analysis

## Preternatural Frameworks
The following Preternatural Frameworks were used in this project: 
- [AI](https://github.com/PreternaturalAI/AI): The definitive, open-source Swift framework for interfacing with generative AI.

## License

This package is licensed under the [MIT License](https://github.com/PreternaturalAI/AI/blob/main/LICENSE).
