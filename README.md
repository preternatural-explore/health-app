# HealthApp: Nutritional Insight from Food Photos
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

A simple app to upload an image to OpenAI Vision for analysis. If the item is food we will gather the pros, cons, type & overall summary about the food.

## Features

|  | Main Features |
| :-------- | :-----------|
| 📖 | Open Source |
|📸|Take a photo|
|📈|Upload & Analyze|
|💸|Subscription handling*|

*Subscription handling needs more logic to work as intended.

## Requirements

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | OpenAI API Key |
|iOS|16.0+|Swift Package Manager|

## Installation
To install and run HealthApp:
1. Download and open the project
2. Add your OpenAI API Key in the `MealController` file:

```swift
// MealController
private let openAIClient = OpenAI.Client(apiKey: "YOUR_API_KEY")
```
*You can get the OpenAI API key on the [OpenAI developer website](https://platform.openai.com/). Note that you have to set up billing and add a small amount of money for the API calls to work (this will cost you less than 1 dollar).* 

3. Run the project on your iPhone. Note that you'll need to use the Camera, so run on device.
4. Take a picture of your food to get the health details: 

https://github.com/preternatural-explore/health-app/blob/main/313036265-c294c3e1-ec6b-4118-9ac1-cdedeaef074b.mov
