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
    @IBOutlet weak var IngredientsView: UIView!
    @IBOutlet weak var IngredientsFrameView: UIView!
    
    var ingredients: [LookUpIngredientsByIDResponse]?
    var drink: FilterByAlcoholResponse.Drink?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let backButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action:  #selector(dismiss))

        self.navigationItem.rightBarButtonItem = backButton
        
   //     IngredientsFrameView.layer.borderWidth = 1.0
    //    IngredientsFrameView.layer.borderColor = UIColor.black.cgColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let id = Int(drink!.DrinkID)
        _ = DrinksAPI.sharedInstance().lookUpCocktailByIDRequest(id: id!, completionHandler:handleLookUpCocktailByIDRequestResponse  (drinkInformation:error:))
        

    }
    
    func handleLookUpCocktailByIDRequestResponse(drinkInformation: LookUpCocktailByIDResponse?, error: Error?)
    {
        
        let mirror = Mirror(reflecting: drinkInformation?.CockTail as Any)
        
        for case let (label?, value) in Mirror(reflecting: mirror)
            .children.map({ ($0.label, $0.value) }) {
            print("label: \(label), value: \(value)")
        }
        
        DispatchQueue.main.async {
            self.Cocktail.text = drinkInformation?.CockTail?[0].DrinkStr
            self.InstructionsLabel.text = drinkInformation?.CockTail?[0].InstructionsStr
   
        }

        let url = URL(string: (drinkInformation?.CockTail?[0].DrinkThumbStr)!)!
        CocktailImageView.load(url: url)
    }
 
    
    @objc func dismiss(sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion:nil)
    }
}

