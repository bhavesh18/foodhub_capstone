//
//  OrderHistoryData.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 18/03/21.
//

import Foundation

class OrderHistoryData: Codable{
    var name = ""
    var price = ""
    var phone = ""
    var password = ""
    var orderHistory: [String] = []
    
    init() {
        
    }
    
}
