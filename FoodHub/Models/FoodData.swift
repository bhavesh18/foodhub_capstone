//
//  FoodData.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import Foundation

class FoodData: Codable{
    var uid: String
    var resUid: String
    var img: String
    var name: String
    var calories: String
    var price: Double
    var detail: String
    var quantity: Int = 1
    var date: String = ""
    var restaurant = ""
    
    init(uid: String,resUid: String, img: String, name: String, calories: String, price: Double, detail: String) {
        self.uid = uid
        self.resUid = resUid
        self.img = img
        self.name = name
        self.calories = calories
        self.price = price
        self.detail = detail
    }
    
}
