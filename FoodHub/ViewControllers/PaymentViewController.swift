//
//  PaymentViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 23/03/21.
//

import UIKit

class PaymentViewController: UIViewController {
    
    //variables
    var onPayment: (()->())? = nil
    var selectedOption = 0
    //MARK:- Outlet
    @IBOutlet weak var codRadio: UIButton!
    @IBOutlet weak var cardRadio: UIButton!
    @IBOutlet weak var cardStackView: UIStackView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var cardNoTF: UITextField!
    @IBOutlet weak var cvvTF: UITextField!
    @IBOutlet weak var expDateTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardStackView.isHidden = true
    }
    
    //MARK:- Action
    
    @IBAction func onRadioBtnTap(_ sender: UIButton) {
        selectedOption = sender.tag
        if(sender.tag == 0){
            codRadio.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            codRadio.tintColor = UIColor(named: "AppPrimary")
            
            cardRadio.setImage(UIImage(systemName: "circle"), for: .normal)
            cardRadio.tintColor = .black
            cardStackView.isHidden = true
        }else{
            cardRadio.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            cardRadio.tintColor = UIColor(named: "AppPrimary")
            
            codRadio.setImage(UIImage(systemName: "circle"), for: .normal)
            codRadio.tintColor = .black
            cardStackView.isHidden = false
        }
    }
    
    
    @IBAction func onPayTap(_ sender: UIButton) {
        if(selectedOption == 0){
            dismiss(animated: true) {
                self.onPayment?()
            }
        }else{
            if(nameTF.text == "" || cardNoTF.text == "" || cvvTF.text == "" || expDateTF.text == ""){
                showAlert(msg: "Please fill all the details.")
            }else{
                dismiss(animated: true) {
                    self.onPayment?()
                }
                
            }
        }
        
    }
    
    @IBAction func onCancelTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
