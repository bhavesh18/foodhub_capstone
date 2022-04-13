//
//  FoodListViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 28/03/21.
//

import UIKit
import FirebaseFirestore

class FoodListViewController: UIViewController {
    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var list: [FoodData] = []
//    Constants.foodList
    var restaurantName = ""
    var resUid = ""
    let foodListCollection = Firestore.firestore().collection("foodList")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        self.heading.text = restaurantName
        tableView.dataSource = self
        tableView.delegate = self
        getFoodList()
    }
    
    func getFoodList(){
        foodListCollection.document(resUid).collection("foodItems").addSnapshotListener { documentSnapshot, err in
            
            guard let docSnapshot = documentSnapshot?.documents else{return}
            
            self.list = docSnapshot.compactMap { (queryDoc) -> FoodData in
                let data = queryDoc.data()
                return FoodData(uid: queryDoc.documentID, resUid: self.resUid, img: data["img"] as? String ?? "", name: data["name"] as? String ?? "", calories: data["calories"] as? String ?? "", price: data["price"] as? Double ?? 0.1, detail: data["detail"] as? String ?? "")
            }
            self.tableView.reloadData()
        }
    }
    
    //MARK:- Actions
    @IBAction func onBackTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}

extension FoodListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        cell.configure(data: list[indexPath.row],restaurant: restaurantName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = list[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as! FoodDetailViewController
        vc.modalPresentationStyle = .fullScreen
        vc.foodData = rowData
        vc.restaurantName = self.restaurantName
        present(vc, animated: true)
        
    }
    
}
