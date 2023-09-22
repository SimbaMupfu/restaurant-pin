//
//  Restaurant.swift
//  RestaurantPin
//
//  Created by Simbarashe Mupfururirwa on 2023/09/12.
//

import Foundation
import Combine

class Restaurant: ObservableObject {
    @Published var name: String
    @Published var type: String
    @Published var location: String
    @Published var phone: String
    @Published var description: String
    @Published var image: String
    @Published var isFavourite: Bool
    @Published var rating: Rating?
    
    init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavourite: Bool, rating: Rating? = nil) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavourite = isFavourite
        self.rating = rating
    }
    
    enum Rating: String, CaseIterable{
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String{
            switch self{
            case . awesome: return "love"
            case .good: return "cool"
            case .okay: return "happy"
            case .bad: return "sad"
            case .terrible: return "angry"
            }
        }
    }
}
