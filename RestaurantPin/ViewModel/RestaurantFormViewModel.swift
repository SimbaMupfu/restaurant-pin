//
//  RestaurantFormViewModel.swift
//  RestaurantPin
//
//  Created by Simbarashe Mupfururirwa on 2023/10/03.
//

import Foundation
import Combine
import UIKit

class RestaurantFormViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var location: String = ""
    @Published var phone: String = ""
    @Published var description: String = ""
    @Published var image: UIImage = UIImage()
    
    init(restaurant: Restaurant? = nil) {
        if let restaurant = restaurant {
            self.name = restaurant.name
            self.type = restaurant.type
            self.location = restaurant.location
            self.description = restaurant.description
            self.phone = restaurant.phone
            self.image = UIImage(data: restaurant.image) ?? UIImage()
        }
    }
}
