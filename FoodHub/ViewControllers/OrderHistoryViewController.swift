//
//  OrderHistoryViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 18/03/21.
//

import UIKit

class OrderHistoryViewController: UIViewController {
    //MARK:- Tableview
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Label
    @IBOutlet weak var noOrderLabel: UILabel!
    
    //MARK:- variable
    let orderList = SessionManager.i.localData.currentUser.orderHistory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        if(!orderList.isEmpty){
            noOrderLabel.removeFromSuperview()
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
