//
//  CartCell.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 18/03/21.
//

import Foundation
import UIKit

class CartCell: UITableViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var index = 0
    var onRemove: ((Int)->())? = nil
    
    //updating cell data
    func configure(data: FoodData, index: Int){
        self.index = index
        imgView.image = UIImage(named: data.img)
        nameLabel.text = data.name
        quantityLabel.text = "Qty: \(data.quantity)"
        priceLabel.text = "Price: $\(data.price * Double(data.quantity))"
    }
    
    @IBAction func onRemove(_ sender: Any) {
        onRemove?(index)
    }
    
}
