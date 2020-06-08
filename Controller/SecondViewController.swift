//
//  SecondViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var ingredients: [LookUpIngredientsByIDResponse] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        _ = DrinksAPI.sharedInstance().lookUpIngredientsByIDRequest(id: 552, completionHandler: handlelookUpIngredientsByIDResponse(ingredients:error:))
        
        _ = DrinksAPI.sharedInstance().filterByAlcoholRequest(alcoType: "Alcoholic", completionHandler: handleFilterByAlcoholResponse(differentDrinks:error:))
        
    }
    
    func handleFilterByAlcoholResponse(differentDrinks: FilterByAlcoholResponse?, error: Error?) {
        Drinks.sharedArray.fetchedDrinks = differentDrinks?.Drinks
        DispatchQueue.main.async {
         self.tableView?.reloadData()
             }
        }
    
    func handlelookUpIngredientsByIDResponse(ingredients: LookUpIngredientsByIDResponse?, error: Error?) {
        Drinks.sharedArray.fetchedIngredients = ingredients?.Ingredients
        DispatchQueue.main.async {
         self.tableView?.reloadData()
             }
        }
    
    }





extension SecondViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let lastfetched = Drinks.sharedArray.fetchedDrinks

        if (lastfetched == nil)
        {
            return 0
        }
        else
        {
            return lastfetched!.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinksCell") as! DrinksCell
        let drink =  Drinks.sharedArray.fetchedDrinks![(indexPath).row]
        cell.drinkName.text = drink.DrinkStr
    //    cell.name.text = "\(drink.  ?? " ")  \(drink.lastName ?? " ")"
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let url = Helpers.sharedHelper.validateStringToURL(urlString: StudentInformations.sharedArray.lastFetched![(indexPath).row].mediaURL!)
//        if (url != nil)
//        {
//          UIApplication.shared.open(url!)
//        }
//    }
}

