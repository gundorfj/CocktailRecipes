//
//  DrinkViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 09/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DrinkViewController: BaseViewController
{

    @IBOutlet weak var Cocktail: UILabel!
    @IBOutlet weak var CocktailImageView: UIImageView!
    @IBOutlet weak var InstructionsLabel: UILabel!
    @IBOutlet weak var IngredientsView: UIView!
    @IBOutlet weak var IngredientsFrameView: UIView!
    @IBOutlet weak var IngredientsLabel: UILabel!
    @IBOutlet weak var IngredientsHeader: PaddingLabel!
    @IBOutlet weak var IngredientsBody: PaddingLabel!
    @IBOutlet weak var InstructionsHeader: PaddingLabel!
    @IBOutlet weak var InstructionsBody: PaddingLabel!
    
    var ingredients: [LookUpIngredientsByIDResponse]?
    var drink: FilterByAlcoholResponse.Drink?

    var ingredientsDictionary = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action:  #selector(dismiss))

        self.navigationItem.rightBarButtonItem = closeButton
        
        CocktailImageView.layer.borderWidth = 1.0
        CocktailImageView.layer.borderColor = UIColor.systemGray4.cgColor
        
        IngredientsHeader.layer.borderWidth = 1.0
        IngredientsHeader.layer.cornerRadius = 3.0
        IngredientsBody.layer.borderWidth = 1.0
        IngredientsBody.layer.borderColor = UIColor.systemGray4.cgColor
        IngredientsBody.layer.cornerRadius = 3.0
        
        InstructionsHeader.layer.borderWidth = 1.0
        InstructionsHeader.layer.cornerRadius = 3.0
        InstructionsBody.layer.borderWidth = 1.0
        InstructionsBody.layer.borderColor = UIColor.systemGray4.cgColor
        InstructionsBody.layer.cornerRadius = 3.0

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let id = Int(drink!.DrinkID)
        _ = DrinksAPI.sharedInstance().lookUpCocktailByIDRequest(id: id!, completionHandler:handleLookUpCocktailByIDRequestResponse  (drinkInformation:error:))
    }
    
    func handleLookUpCocktailByIDRequestResponse(drinkInformation: LookUpCocktailByIDResponse?, error: Error?)
    {
        guard let drinkInformation = drinkInformation else {
            return
        }
        DispatchQueue.main.async {
            self.Cocktail.text = drinkInformation.CockTail?[0].DrinkStr
            self.InstructionsLabel.text = drinkInformation.CockTail?[0].InstructionsStr
            _ = self.exstractIngredients(cocktaildata: (drinkInformation.CockTail?[0])!)
        }

        let url = URL(string: (drinkInformation.CockTail?[0].DrinkThumbStr)!)!
        CocktailImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"),options: SDWebImageOptions(rawValue: 0), completed: { image, error, cacheType, imageURL in
        })
    }
 
    
    @objc func dismiss(sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion:nil)
    }
    

    private func exstractIngredients(cocktaildata: CockTailData) -> [String: String]
    {
        var cocktailsDictionary = Dictionary<String, String>()

        cocktailsDictionary[cocktaildata.IngredientStr1!] = cocktaildata.MeasureStr1
        cocktailsDictionary[cocktaildata.IngredientStr2!] = cocktaildata.MeasureStr2
        cocktailsDictionary[cocktaildata.IngredientStr3!] = cocktaildata.MeasureStr3
        cocktailsDictionary[cocktaildata.IngredientStr4!] = cocktaildata.MeasureStr4
        cocktailsDictionary[cocktaildata.IngredientStr5!] = cocktaildata.MeasureStr5
        cocktailsDictionary[cocktaildata.IngredientStr6!] = cocktaildata.MeasureStr6
        cocktailsDictionary[cocktaildata.IngredientStr7!] = cocktaildata.MeasureStr7
        cocktailsDictionary[cocktaildata.IngredientStr8!] = cocktaildata.MeasureStr8
        cocktailsDictionary[cocktaildata.IngredientStr9!] = cocktaildata.MeasureStr9
        cocktailsDictionary[cocktaildata.IngredientStr10!] = cocktaildata.MeasureStr10
        cocktailsDictionary[cocktaildata.IngredientStr11!] = cocktaildata.MeasureStr11
        cocktailsDictionary[cocktaildata.IngredientStr12!] = cocktaildata.MeasureStr12
        cocktailsDictionary[cocktaildata.IngredientStr13!] = cocktaildata.MeasureStr13
        cocktailsDictionary[cocktaildata.IngredientStr14!] = cocktaildata.MeasureStr14
        cocktailsDictionary[cocktaildata.IngredientStr15!] = cocktaildata.MeasureStr15

        var text = IngredientsLabel.text;

        for data in cocktailsDictionary.sorted(by: { $0.key < $1.key })
        {
            if (!text!.isEmpty)
            {
                text! += "\r\n"
            }
            
            if (data.value != "" )
            {
                text! += "\(data.value)"
            }
            if (data.key != "" )
            {
                text! += " \(data.key)"
            }
        }
        IngredientsLabel.text = text
        return cocktailsDictionary
    }
}


class PaddingLabel: UILabel {

   @IBInspectable var topInset: CGFloat = 5.0
   @IBInspectable var bottomInset: CGFloat = 5.0
   @IBInspectable var leftInset: CGFloat = 5.0
   @IBInspectable var rightInset: CGFloat = 5.0

   override func drawText(in rect: CGRect) {
      let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
      super.drawText(in: rect.inset(by: insets))
   }

   override var intrinsicContentSize: CGSize {
      get {
         var contentSize = super.intrinsicContentSize
         contentSize.height += topInset + bottomInset
         contentSize.width += leftInset + rightInset
         return contentSize
      }
   }
}
