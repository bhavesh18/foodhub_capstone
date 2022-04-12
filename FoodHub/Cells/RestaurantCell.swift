//
//  RestaurantCell.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 28/03/21.
//

import UIKit

class RestaurantCell: UITableViewCell{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dishes: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = nil
    }
    
    func configure(data: RestaurantData){
        img.image = UIImage(named: data.img)
        name.text = data.name
        dishes.text = data.dishes
        rating.text = data.rating
        
    }
    
}
