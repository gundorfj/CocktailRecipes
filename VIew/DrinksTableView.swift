//
//  DrinksTableView.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 10/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit


class DrinksTableViewDelegate: NSObject,UITableViewDelegate{


    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Segue to the second view controller
   //     self.performSegue(withIdentifier: "segueShowDrinksNavigation", sender: self)
    }
}


class DrinksTableViewSource: NSObject, UITableViewDataSource{
    private var tableView: UITableView

    var ingredientsDictionary = [String: [FilterByAlcoholResponse.Drink]]()
    var ingredientsTitles = [String]()
    var ingredients: [LookUpIngredientsByIDResponse] = []

    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return ingredientsTitles.count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let ingredientsKey = ingredientsTitles[section]
            if let ingredientsValues = ingredientsDictionary[ingredientsKey] {
                return ingredientsValues.count
            }
            return 0
        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return ingredientsTitles[section]
        }

         func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return ingredientsTitles
        }


        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrinksCell") as! DrinksCell
           // let drink =  Drinks.sharedArray.fetchedDrinks![(indexPath).row]

            let drinkKey = ingredientsTitles[indexPath.section]

            if let drinkValues = ingredientsDictionary[drinkKey] {
                cell.drinkName.text = drinkValues[indexPath.row].DrinkStr
                let url = URL(string: drinkValues[indexPath.row].DrinkThumbStr)
                cell.drinkImage.load(url: url!)
            }

            let oddEven = (indexPath).row  % 2 == 0

            switch oddEven {

            case true:
       //      self.view.backgroundColor = UIColor(red: 0.3529, green: 0.7608, blue: 0.8471, alpha: 1.0)
                cell.backgroundColor = UIColor(red: 0.3529, green: 0.7608, blue: 0.8471, alpha: 1.0)
                cell.textLabel?.textColor = UIColor.white
            case false:
    //     self.view.backgroundColor = UIColor(red: 0.9882, green: 0.5804, blue: 0.0078, alpha: 1.0)
                cell.backgroundColor = UIColor(red: 0.9882, green: 0.5804, blue: 0.0078, alpha: 1.0)
                cell.textLabel?.textColor = UIColor.white
            }

            return cell
        }

}
