//
//  AuthManager.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 12/04/22.
//

import Foundation
import FirebaseAuth


class AuthManager {
    
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    private var verificationID: String?
    
    func createUser(email: String, password: String, completion: @escaping (Bool, Any?)->()){
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "firebase login error")
                completion(false, error?.localizedDescription)
                return
            }
            let usr = authResult?.user
            completion(true, usr)
            print("User created!!!")
            
        }
        
    }
    
    
    func signIn(email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }

            

        }
        
    }
    
    func signOut(){
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
