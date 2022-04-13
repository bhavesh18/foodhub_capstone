//
//  OrderHistoryViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 18/03/21.
//

import UIKit
import FirebaseFirestore

class OrderHistoryViewController: UIViewController {
    //MARK:- Tableview
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Label
    @IBOutlet weak var noOrderLabel: UILabel!
    
    //MARK:- variable
    var orderList:[FoodData] = []
//    SessionManager.i.localData.currentUser.orderHistory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        fetchOrderHistory()
    }
    
    func fetchOrderHistory(){
        Firestore.firestore().collection("orderHistory").document(SessionManager.i.localData.currentUser.uid).collection("orderHistory").getDocuments { query, err in
            guard let query = query?.documents else{return}
            self.orderList = query.compactMap({ (querySnap) -> FoodData in
                let data = querySnap.data()
                
                let foodData = FoodData(uid: data["uid"] as? String ?? "", resUid: data["resUid"] as? String ?? "", img: data["img"] as? String ?? "", name: data["name"] as? String ?? "", calories: data["calories"] as? String ?? "", price: data["price"] as? Double ?? 0.1, detail: data["detail"] as? String ?? "")
                
                foodData.date = data["date"] as? String ?? ""
                foodData.quantity = data["quantity"] as? Int ?? 1
                foodData.restaurant = data["restaurant"] as? String ?? ""
                
                return foodData
            })
            
            if(!self.orderList.isEmpty){
                self.noOrderLabel.removeFromSuperview()
            }
            
            self.tableView.reloadData()
        }
    }
    
    //MARK:- Actions
    @IBAction func onCloseTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func onHelpTap(_ sender: UIButton) {
        showAlert(msg: "Feel free to contact us: 631-3855-444")
    }
    
    
}

extension OrderHistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCell", for: indexPath) as! OrderHistoryCell
        cell.configure(data: orderList[indexPath.row])
        return cell
    }
    
    
}
