//
//  AppetizerModel.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

struct Appetiser: Decodable {
    let id: Int
    let description: String
    let name: String
    let carbs: Int
    let calories: Int
    let protein: Int
    let imageUrl: String
    let price: Double
   
    enum CodingKeys: String, CodingKey {
        case description =  "description"
        case name = "name"
        case carbs = "carbs"
        case id = "id"
        case calories = "calories"
        case protein = "protein"
        case imageUrl = "imageURL"
        case price = "price"
    }
}

struct AppetiserResponse: Decodable {
    let request: [Appetiser]
}

struct MockData {
    static let sampleAppetiser = Appetiser(
        id: 1,
        description: "This is a sample appetiser",
        name: "Sample Appetiser",
        carbs: 9,
        calories: 2,
        protein: 8,
        imageUrl: "",
        price: 9.99)
    
    static let appetisers = [sampleAppetiser, sampleAppetiser, sampleAppetiser, sampleAppetiser]
}
