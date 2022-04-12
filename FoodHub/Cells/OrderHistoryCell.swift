//
//  OrderHistoryCell.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 18/03/21.
//

import UIKit

class OrderHistoryCell: UITableViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var restaurantLabel: UILabel!
    
    //updating cell data
    func configure(data: FoodData){
        imgView.image = UIImage(named: data.img)
        nameLabel.text = data.name
        quantityLabel.text = "Qty: \(data.quantity)"
        priceLabel.text = "Price: $\(data.price * Double(data.quantity))"
        dateLabel.text = "Date: " + data.date
        restaurantLabel.text = "(" + data.restaurant + ")"
    }
    
}
