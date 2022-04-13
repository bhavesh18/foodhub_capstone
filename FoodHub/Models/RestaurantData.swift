//
//  RestaurantData.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 28/03/21.
//

import Foundation

class RestaurantData: Codable{
    var uid: String
    var img: String
    var name: String
    var rating: String
    var dishes: String
    var foodList:[FoodData]
    
    init(uid: String,img: String, name: String, rating: String, dishes: String,foodList: [FoodData]) {
        self.uid = uid
        self.img = img
        self.name = name
        self.rating = rating
        self.dishes = dishes
        self.foodList = foodList
    }
    
}
