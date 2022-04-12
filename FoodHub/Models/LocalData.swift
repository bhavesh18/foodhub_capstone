//
//  LocalData.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 14/03/21.
//

import Foundation

class LocalData: Codable{
    var currentUser = UserData()
    var users: [UserData] = []
    var cartList: [FoodData] = []
    var isLoggedIn = false
}
