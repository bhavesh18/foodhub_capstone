//
//  UsersData.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 14/03/21.
//

import Foundation

class UserData: Codable{
    var name = ""
    var email = ""
    var phone = ""
    var password = ""
    var address = ""
    var orderHistory: [FoodData] = []
    
    init() {
        
    }
    
}
