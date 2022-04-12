//
//  SessionManager.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 14/03/21.
//

import Foundation

class SessionManager{
    
    static let i = SessionManager()
    var localData = LocalData()
    
    init() {
        if let data = UserDefaults.standard.string(forKey: Constants.LOCAL_DATA){
            if let ld = data.getObject(ofType: LocalData()){
                self.localData = ld
            }
        }
    }
    
    func save(){
        if let data = self.localData.getJsonString(){
            UserDefaults.standard.setValue(data, forKey: Constants.LOCAL_DATA)
        }
    }
    
    func getCurrentUserIndex()->Int?{
        return localData.users.firstIndex(where: {$0.email == localData.currentUser.email})
    }
    
}
