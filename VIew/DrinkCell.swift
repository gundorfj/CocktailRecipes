//
//  DrinkCell.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 26/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class DrinkCell : UITableViewCell
{
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
