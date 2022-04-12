//
//  LoginViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK:- Imageview and segment
    @IBOutlet weak var wallpaperIV: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    //MARK:- TextFields
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confPasswordTF: UITextField!
    
    //MARK:- Stackview
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var phoneStackView: UIStackView!
    @IBOutlet weak var confPassStackView: UIStackView!
    
    //MARK:- Button
    @IBOutlet weak var loginBtn: UIButton!
    
    //MARK:- variables
    var selectedSegment = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(SessionManager.i.localData.users.getJsonString())
        setupView()
    }

    //checking if user already logged in then moving to homescreen.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(SessionManager.i.localData.isLoggedIn){
            goToHomeScreen()
        }
    }
    
    //when view disappear we reset our UI
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetData()
        setupView()
        segment.selectedSegmentIndex = 0
        loginBtn.setTitle("Login", for: .normal)
    }
    
    //setting up view layouts
    func setupView(){
        wallpaperIV.layer.cornerRadius = 30
        confPassStackView.isHidden = true
        segment.setTitleColor(.white, state: .selected)
        nameStackView.isHidden = true
        phoneStackView.isHidden = true
        loginBtn.layer.cornerRadius = 12
    }

    //resetting data to default state
    func resetData(){
        hideKeyboard()
        nameTF.text = ""
        emailTF.text = ""
        phoneTF.text = ""
        passwordTF.text = ""
        confPasswordTF.text = ""
    }
    
    //moving to the home screen
    func goToHomeScreen(){
        SessionManager.i.save()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    //validating entries by user
    func isValidEntry() -> Bool{
        if(selectedSegment == 0){
            //login
            if(emailTF.text == ""){
                showAlert(msg: "Email is empty")
                return false
            }else if(!emailTF.text!.isValidEmail()){
                showAlert(msg: "Inavlid email format")
                return false
            }else if(passwordTF.text == ""){
                showAlert(msg: "Password is empty")
                return false
            }
        }else{
            //signup
            if(nameTF.text == ""){
                showAlert(msg: "Name is empty")
                return false
            }else if(emailTF.text == ""){
                showAlert(msg: "Email is empty")
                return false
            }else if(!emailTF.text!.isValidEmail()){
                showAlert(msg: "Inavlid email format")
                return false
            }else if(phoneTF.text == ""){
                showAlert(msg: "Phone is empty")
                return false
            }else if(passwordTF.text == ""){
                showAlert(msg: "Password is empty")
                return false
            }else if(confPasswordTF.text == ""){
                showAlert(msg: "Confirm Password is empty")
                return false
            }else if(passwordTF.text != confPasswordTF.text){
                showAlert(msg: "Password does not match")
                return false
            }
        }
        return true
    }
    
    func showInputAlert(){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Forgot Password", message: "", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Enter email"
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {  (_) in
            let textField = alert.textFields![0] // Force unwrapping because we know it exists.
            if(textField.text == ""){
                
            }else{
                if let user = SessionManager.i.localData.users.first(where: {$0.email == textField.text!}){
                    self.showAlert(msg: "Your password is: \(user.password)")
                }else{
                    self.showAlert(msg: "Make sure the email is correct.")
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- IBActions
    
    @IBAction func onSegmentTap(_ sender: UISegmentedControl) {
        resetData()
        self.selectedSegment = sender.selectedSegmentIndex
        confPassStackView.isHidden = sender.selectedSegmentIndex == 0
        nameStackView.isHidden = sender.selectedSegmentIndex == 0
        phoneStackView.isHidden = sender.selectedSegmentIndex == 0
        loginBtn.setTitle(sender.selectedSegmentIndex == 0 ? "Login" : "Sign up", for: .normal)
    }
    
    @IBAction func onLoginTap(_ sender: UIButton) {
        
        let localData = SessionManager.i.localData
        if(self.selectedSegment == 0){
            //login
            if(isValidEntry() && localData.users.contains(where: ({$0.email == self.emailTF.text! && $0.password == self.passwordTF.text!}))){
                let matchedUser = localData.users.first(where: ({$0.email == emailTF.text!}))!
                matchedUser.email = emailTF.text!
                matchedUser.password = passwordTF.text!
                localData.currentUser = matchedUser
                goToHomeScreen()
            }else{
                showAlert(msg: "Invalid Email or password.")
            }
        }else{
            //signup
            if(isValidEntry() && localData.users.contains(where: ({$0.email.lowercased() == self.emailTF.text!.lowercased()}))){
                showAlert(msg: "Email already exists.")
            }else{
                if(isValidEntry()){
                    let userData = UserData()
                    userData.name = self.nameTF.text!
                    userData.email = self.emailTF.text!
                    userData.phone = self.phoneTF.text!
                    userData.password = self.passwordTF.text!
                    userData.orderHistory = []
                    localData.users.append(userData)
                    localData.currentUser = userData
                    goToHomeScreen()
                }
            }
        }
        
    }
    
    @IBAction func onForgotPasswordTap(_ sender: UIButton) {
        showInputAlert()
    }
    
}
