//
//  FoodDetailViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import UIKit

class FoodDetailViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var cartBtn: UIButton!
    
    //MARK:- Variables
    var restaurantName = ""
    var foodData: FoodData!
    var totalQuantity: Int = 0
    var totalAmount: Double = 0
    
    var shakeOnce = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView(){
        img.image = UIImage(named: foodData.img)
        name.text = foodData.name
        calories.text = foodData.calories + " calories"
        detail.text = foodData.detail
        price.text = "$\(foodData.price)"
        quantity.text = foodData.name + " (x\(totalQuantity))"
        totalPrice.text = "$"+String(totalAmount)
        cartBtn.isEnabled = false
        cartBtn.layer.opacity = 0.5
        cartBtn.layer.cornerRadius = 12
    }
    
    
    //MARK:- IBActions
    @IBAction func onStepperTap(_ sender: UIStepper) {
        cartBtn.isEnabled = sender.value > 0
        cartBtn.layer.opacity = sender.value > 0 ? 1.0 : 0.5
        totalQuantity = Int(sender.value)
        quantity.text = foodData.name + "(x\(totalQuantity))"
        totalAmount = Double(totalQuantity)*foodData.price
        totalPrice.text = "$"+String(totalAmount)
        
        if(shakeOnce){
            cartBtn.shake()
        }
        
        shakeOnce = sender.value == 0 ? true : false
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        guard let fd = foodData else{return}
        fd.quantity = totalQuantity
        fd.restaurant = restaurantName
        SessionManager.i.localData.cartList.append(fd)
        SessionManager.i.save()
        showAlert(msg: "Added to cart!") {
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
