//
//  DrinksTableView.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 10/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class DrinksTableView : UITableView
{

//    func numberOfSections(in tableView: UITableView) -> Int {
//        // 1
//        return ingredientsTitles.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // 2
//        let ingredientsKey = ingredientsTitles[section]
//        if let ingredientsValues = ingredientsDictionary[ingredientsKey] {
//            return ingredientsValues.count
//        }
//
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ingredientsTitles[section]
//    }
//
//     func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return ingredientsTitles
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinksCell") as! DrinksCell
//       // let drink =  Drinks.sharedArray.fetchedDrinks![(indexPath).row]
//
//        let drinkKey = ingredientsTitles[indexPath.section]
//
//        if let drinkValues = ingredientsDictionary[drinkKey] {
//            cell.drinkName.text = drinkValues[indexPath.row].DrinkStr
//            let url = URL(string: drinkValues[indexPath.row].DrinkThumbStr)
//            cell.drinkImage.load(url: url!)
//        }
//
//
//
//        let oddEven = (indexPath).row  % 2 == 0
//
//        switch oddEven {
//
//        case true:
//            self.view.backgroundColor = UIColor(red: 0.3529, green: 0.7608, blue: 0.8471, alpha: 1.0)
//            cell.backgroundColor = UIColor(red: 0.3529, green: 0.7608, blue: 0.8471, alpha: 1.0)
//            cell.textLabel?.textColor = UIColor.white
//        case false:
//            self.view.backgroundColor = UIColor(red: 0.9882, green: 0.5804, blue: 0.0078, alpha: 1.0)
//            cell.backgroundColor = UIColor(red: 0.9882, green: 0.5804, blue: 0.0078, alpha: 1.0)
//            cell.textLabel?.textColor = UIColor.white
//        }
//
//        return cell
//    }
//
//    // method to run when table view cell is tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // Segue to the second view controller
//        self.performSegue(withIdentifier: "segueShowNavigation", sender: self)
//    }
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueShowNavigation" {
//            if let destVC = segue.destination as? UINavigationController,
//                let drinkViewController = destVC.topViewController as? DrinkViewController {
//             if let indexPath = tableView.indexPathForSelectedRow {
//                    drinkViewController.drink = Drinks.sharedArray.fetchedDrinks![(indexPath).row]
//                }
//            }
//        }
//    }
}
