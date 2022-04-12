//
//  FoodCell.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import Foundation
import UIKit

class FoodCell: UITableViewCell{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var calogries: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = nil
    }
    
    //updating cell data
    func configure(data: FoodData, restaurant: String = ""){
        img.contentMode = (restaurant == "Tim Horton") ? .scaleAspectFit : .scaleAspectFill
        img.image = UIImage(named: data.img)
        name.text = data.name
        calogries.text = data.calories + " Calories"
        price.text = "$\(data.price)"
    }
    
}
