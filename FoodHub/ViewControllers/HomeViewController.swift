//
//  ViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- Tableview and Label
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var cartBadge: UILabel!
    
    //MARK:- Variables
    var list: [RestaurantData] = Constants.resaturantList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SessionManager.i.localData.isLoggedIn = true
        SessionManager.i.save()
        setupView()
    }

    func setupView(){
        tableView.dataSource = self
        tableView.delegate = self
    }

    func handleCartBadge(){
        if(SessionManager.i.localData.cartList.count == 0){
            cartBadge.isHidden = true
            cartBadge.text = ""
        }else{
            cartBadge.isHidden = false
            cartBadge.text = "\(SessionManager.i.localData.cartList.count)"
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        welcomeLabel.text = "Hi " + SessionManager.i.localData.currentUser.name + ","
        handleCartBadge()
    }
    
    //MARK:- IBActions
    
    @IBAction func onProfileTap(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func onCartTap(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func onOrderHistoryTap(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderHistoryViewController") as! OrderHistoryViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        cell.configure(data: list[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = list[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FoodListViewController") as! FoodListViewController
        vc.modalPresentationStyle = .fullScreen
        vc.list = rowData.foodList
        vc.restaurantName = rowData.name
        present(vc, animated: true)

    }

}

