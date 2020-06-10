//
//  IngredientCell.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 10/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class IngredientCell: UITableViewCell {

    @IBOutlet weak var ingredientName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
