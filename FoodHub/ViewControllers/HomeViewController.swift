//
//  ViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import UIKit
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    //MARK:- Tableview and Label
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var cartBadge: UILabel!
    
    var cartCount = 0
    
    let restaurantCollection = Firestore.firestore().collection("restaurants")
    
    //MARK:- Variables
    var list: [RestaurantData] = []
        
    var filteredList: [RestaurantData] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    enum Category: String{
        case outlet = "outlet"
        case homeCooked = "homeCooked"
        case tiffin = "tiffin"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SessionManager.i.localData.isLoggedIn = true
        SessionManager.i.save()
        
        Firestore.firestore().collection("cart").getDocuments { q, err in
            guard let docs = q?.documents else {return}
            if(!docs.isEmpty){
                self.setupView()
            }
        }
        
    }
    
    func setupView(){
        
        restaurantCollection.addSnapshotListener { documentSnapshot, err in
            guard let document = documentSnapshot?.documents else {
                print("Error fetching document: \(err!)")
                return
            }
                        
            self.list = document.compactMap({ (queryDocument) -> RestaurantData in
                let data = queryDocument.data()
                let resUid = queryDocument.documentID
                print("restaurants docID", queryDocument.documentID)
                
                let resData = RestaurantData(uid: resUid, img: data["img"] as? String ?? "dish", name: data["name"] as? String ?? "", rating: data["rating"] as? String ?? "", dishes: data["dishes"] as? String ?? "", category: data["category"] as? String ?? "", foodList: [])
                return resData
            })
            
            self.updateRestaurantsWithCategory(category: .outlet)
            
        }
        
        Firestore.firestore().collection("cart").document(SessionManager.i.localData.currentUser.uid).collection("foodItems").addSnapshotListener { snap, err in
            
            guard let snap = snap?.documents else{return}
            print("CART COUNT-> ", snap.count)
            self.cartCount = snap.count
            self.handleCartBadge()
            
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func updateRestaurantsWithCategory(category: Category){
        
        self.filteredList = self.list.filter {$0.category == category.rawValue}
        
    }
    
    func handleCartBadge(){
//        if(SessionManager.i.localData.cartList.count == 0){
        if(cartCount == 0){
            cartBadge.isHidden = true
            cartBadge.text = ""
        }else{
            cartBadge.isHidden = false
//            cartBadge.text = "\(SessionManager.i.localData.cartList.count)"
            cartBadge.text = "\(self.cartCount)"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        welcomeLabel.text = "Hi " + SessionManager.i.localData.currentUser.name + ","
        handleCartBadge()
    }
    
    //MARK:- IBActions
    
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            //outlets
            updateRestaurantsWithCategory(category: .outlet)
        }else if(sender.selectedSegmentIndex == 1){
            //home cooked
            updateRestaurantsWithCategory(category: .homeCooked)
        }else{
            //tiffin
            updateRestaurantsWithCategory(category: .tiffin)
        }
    }
    
    
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
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        cell.configure(data: filteredList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = filteredList[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FoodListViewController") as! FoodListViewController
        vc.modalPresentationStyle = .fullScreen
        vc.list = rowData.foodList
        vc.restaurantName = rowData.name
        vc.resUid = rowData.uid
        present(vc, animated: true)
        
    }
    
}

