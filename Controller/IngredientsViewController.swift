//
//  CategoryViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 08/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class IngredientsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var ingredientDictionary = [String: [String]]()
    var ingredientTitles = [String]()
    var ingredient: [ListIngredientsResponse] = []

     override func viewDidLoad() {
         super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
     }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if ((Drinks.sharedArray.fetchedCompleteIngrediensList?.isEmpty) == nil)
              {
            _ = DrinksAPI.sharedInstance().listIngredientsRequest(completionHandler: handleListIngredientResponse(allIngredients:error:))
              }
        }
    
    
    func handleListIngredientResponse(allIngredients: ListIngredientsResponse?, error: Error?) {

        Drinks.sharedArray.fetchedCompleteIngrediensList = allIngredients?.Ingredients?.sorted(by: { (Ingredient1, Ingredient2) -> Bool in
            let ingredient1 = Ingredient1.IngredientStr
            let ingredient2 = Ingredient2.IngredientStr
            return (ingredient1.localizedCaseInsensitiveCompare(ingredient2) == .orderedAscending)})
            
//        for element in Drinks.sharedArray.fetchedCompleteIngrediensList! {
//          print(element)
//        }
        
        for ingredient in Drinks.sharedArray.fetchedCompleteIngrediensList! {
            let ingredientKey = String(ingredient.IngredientStr.prefix(1))
                if var ingredientValues = ingredientDictionary[ingredientKey] {
                    ingredientValues.append(ingredient.IngredientStr)
                    ingredientDictionary[ingredientKey] = ingredientValues
                } else {
                    ingredientDictionary[ingredientKey] = [ingredient.IngredientStr]
                }
        }
        
        ingredientTitles = [String](ingredientDictionary.keys)
        ingredientTitles = ingredientTitles.sorted(by: { $0 < $1 })
        
        DispatchQueue.main.async {
         self.tableView?.reloadData()
             }
        }
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.async {
            self.ingredientDictionary.removeAll()
            self.ingredientTitles.removeAll()
            self.tableView?.reloadData()
        }
    }
}

extension IngredientsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        return ingredientTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        let ingredientsKey = ingredientTitles[section]
        if let ingredientsValues = ingredientDictionary[ingredientsKey] {
            return ingredientsValues.count
        }
            
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ingredientTitles[section]
    }
    
     func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ingredientTitles
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as! IngredientCell
        let ingredientKey = ingredientTitles[indexPath.section]
        if let ingredientValues = ingredientDictionary[ingredientKey] {
            cell.ingredientName.text = ingredientValues[indexPath.row]
        }
      //  cell.ingredientName.text = drink.IngredientStr
        
//        cell.drinkImage.load(url: url!)
        
        let oddEven = (indexPath).row  % 2 == 0
        
        switch oddEven {

        case true:
            self.view.backgroundColor = UIColor(red: 0.3529, green: 0.7608, blue: 0.8471, alpha: 1.0)
            cell.backgroundColor = UIColor(red: 0.3529, green: 0.7608, blue: 0.8471, alpha: 1.0)
            cell.textLabel?.textColor = UIColor.white
        case false:
            self.view.backgroundColor = UIColor(red: 0.9882, green: 0.5804, blue: 0.0078, alpha: 1.0)
            cell.backgroundColor = UIColor(red: 0.9882, green: 0.5804, blue: 0.0078, alpha: 1.0)
            cell.textLabel?.textColor = UIColor.white
        }
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Segue to the second view controller
        self.performSegue(withIdentifier: "segueShowCategoryNavigation", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowCategoryNavigation" {
            


            if let destVC = segue.destination as? UINavigationController,
                let drinkViewController = destVC.topViewController as? IngredientsDrinkViewController {
             if let indexPath = tableView.indexPathForSelectedRow {
                    let ingredientKey = ingredientTitles[indexPath.section]
                    if let ingredientValues = ingredientDictionary[ingredientKey] {
                        drinkViewController.commonIngredient = ingredientValues[indexPath.row]
                    }
                }
            }
        }
    }
}

