//
//  FoodListViewController.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 28/03/21.
//

import UIKit

class FoodListViewController: UIViewController {
    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var list: [FoodData] = Constants.foodList
    var restaurantName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        self.heading.text = restaurantName
        tableView.dataSource = self
        tableView.delegate = self
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
