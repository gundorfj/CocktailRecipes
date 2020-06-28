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
    
    var link: DrinksViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let starBUtton = UIButton(type: .system)
        starBUtton.setImage(UIImage(named: "starEnabled"), for: .normal)
        starBUtton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starBUtton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starBUtton
    }
    
    @objc private func handleMarkAsFavorite() {
            link?.someMethodIwantToCall(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

