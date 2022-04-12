//
//  CartViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import UIKit

class CartViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCartLabel: UILabel!
    @IBOutlet weak var placeOrderBtn: UIButton!
    
    //MARK:- Variable
    var cartList:[FoodData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        cartList = SessionManager.i.localData.cartList
        tableView.dataSource = self
        handleOrderBtnState()
    }
    
    func handleOrderBtnState(){
        if(cartList.isEmpty){
            placeOrderBtn.layer.opacity = 0.5
            placeOrderBtn.isEnabled = false
            emptyCartLabel.isHidden = false
        }else{
            placeOrderBtn.layer.opacity = 1
            placeOrderBtn.isEnabled = true
            emptyCartLabel.isHidden = true
        }
    }
    
    func placeOrder(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        vc.onPayment={
            
            if let userIndex = SessionManager.i.getCurrentUserIndex(){
                
                var newList:[FoodData] = []
                self.cartList.forEach { (f) in
                    f.date = self.getTimestamp()
                    newList.append(f)
                }
                
                SessionManager.i.localData.users[userIndex].orderHistory.append(contentsOf: newList)
                SessionManager.i.localData.currentUser.orderHistory = SessionManager.i.localData.users[userIndex].orderHistory
                SessionManager.i.localData.cartList = []
                SessionManager.i.save()
                
                self.showAlert(msg: "Order Successfull!!") {
                    self.dismiss(animated: true)
                }
            }
        }
        present(vc, animated: true)
    }
    
    func showInputAlert(){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add Your Address", message: "", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Enter address"
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {  (_) in
            let textField = alert.textFields![0] // Force unwrapping because we know it exists.
            if(textField.text == ""){
                
            }else{
                if let userIndex = SessionManager.i.getCurrentUserIndex(){
                    SessionManager.i.localData.users[userIndex].address = textField.text ?? ""
                    SessionManager.i.localData.currentUser.address = textField.text ?? ""
                    SessionManager.i.save()
                    self.placeOrder()
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Action
    @IBAction func onCloseTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func onPlaceOrderTap(_ sender: UIButton) {
        
        if(SessionManager.i.localData.currentUser.address == ""){
            showInputAlert()
        }else{
            placeOrder()
        }
    }
}

extension CartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.configure(data: cartList[indexPath.row], index: indexPath.row)
        
        //on delete icon tap
        cell.onRemove = { index in
            self.cartList.remove(at: index)
            SessionManager.i.localData.cartList = self.cartList
            SessionManager.i.save()
            self.handleOrderBtnState()
            self.tableView.reloadData()
        }
        return cell
    }
    
    
}
