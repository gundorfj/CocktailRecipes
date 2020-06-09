//
//  DrinkViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 09/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class DrinkViewController: UIViewController
{

    @IBOutlet weak var Cocktail: UILabel!
    @IBOutlet weak var CocktailImageView: UIImageView!
    @IBOutlet weak var InstructionsLabel: UILabel!
    var ingredients: [LookUpIngredientsByIDResponse]?

    var drink: FilterByAlcoholResponse.Drink?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let id = Int(drink!.DrinkID)
        _ = DrinksAPI.sharedInstance().lookUpCocktailByIDRequest(id: id!, completionHandler:handleLookUpCocktailByIDRequestResponse  (drinkInformation:error:))
    }
    
    func handleLookUpCocktailByIDRequestResponse(drinkInformation: LookUpCocktailByIDResponse?, error: Error?)
    {
        DispatchQueue.main.async {
            self.Cocktail.text = drinkInformation?.CockTail?[0].DrinkStr
            self.InstructionsLabel.text = drinkInformation?.CockTail?[0].InstructionsStr        }

        let url = URL(string: (drinkInformation?.CockTail?[0].DrinkThumbStr)!)!
        CocktailImageView.load(url: url)
    }
    
}

