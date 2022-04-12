//
//  ProfileViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK:- ImageView
    @IBOutlet weak var img: UIImageView!
    
    //MARK:- Textfields
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    
    //MARK:- Buttons
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView(){
        img.layer.cornerRadius = 20
        updateBtn.layer.cornerRadius = 20
        logoutBtn.layer.cornerRadius = 20
        
        let ud = SessionManager.i.localData.currentUser
        nameTF.text = ud.name
        emailTF.text = ud.email
        phoneTF.text = ud.phone
        addressTF.text = ud.address
    }
    
    
    //MARK:- IBOutlets
    
    @IBAction func onCancelBtnTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func update(_ sender: UIButton) {
    
        let localData = SessionManager.i.localData
        let email = localData.currentUser.email
        if let index = localData.users.firstIndex(where: {$0.email == email}){
            localData.users[index].name = nameTF.text!
            localData.users[index].phone = phoneTF.text!
            localData.users[index].address = addressTF.text ?? ""
            localData.currentUser.name = nameTF.text!
            localData.currentUser.phone = phoneTF.text!
            localData.currentUser.address = addressTF.text ?? ""
            SessionManager.i.save()
            showAlert(msg: "Profile updated!"){
                self.hideKeyboard()
            }
        }
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        SessionManager.i.localData.isLoggedIn = false
        SessionManager.i.save()
        self.view.window!.rootViewController?.dismiss(animated: true)
    }
    
}
