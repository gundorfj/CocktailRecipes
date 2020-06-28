//
//  IngredientsDrinkViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 17/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit

class IngredientsDrinkViewController: UIViewController
{
    
    @IBOutlet weak var tableView: UITableView!

    var ingredientsDictionary = [String: [FilterByAlcoholResponse.Drink]]()
    var ingredientsTitles = [String]()
    var ingredients: [LookUpIngredientsByIDResponse] = []
    var refreshControl = UIRefreshControl()
    var commonIngredient: String = ""
    var persistenceController: PersistenceController!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DrinkCell", bundle: nil), forCellReuseIdentifier: "DrinkCell")
        tableView.addSubview(refreshControl)

        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        title = commonIngredient;

        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action:  #selector(dismiss))
        self.navigationItem.rightBarButtonItem = closeButton
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        if (ingredientsDictionary.isEmpty == true || tableView.dataSource == nil)
          {
            refresh()

            _ = DrinksAPI.sharedInstance().searchByIngredientRequest(ingredientType: commonIngredient, completionHandler: handleSearchByIngredientResponse(differentDrinks:error:))
           }
            
        }
    
    @objc func dismiss(sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion:nil)
    }
    
    func handleSearchByIngredientResponse(differentDrinks: FilterByAlcoholResponse?, error: Error?) {
        Drinks.sharedArray.fetchedDrinksByIngredient = differentDrinks?.Drinks?.sorted(by: { (Drink1, Drink2) -> Bool in
            let drink1 = Drink1.DrinkStr
        let drink2 = Drink2.DrinkStr
        return (drink1.localizedCaseInsensitiveCompare(drink2) == .orderedAscending)})
        
        for drink in Drinks.sharedArray.fetchedDrinksByIngredient! {
            let drinkKey = String(drink.DrinkStr.prefix(1))
                if var drinkValues = ingredientsDictionary[drinkKey] {
                    drinkValues.append(drink)
                    ingredientsDictionary[drinkKey] = drinkValues
                } else {
                    ingredientsDictionary[drinkKey] = [drink]
                }
        }
        
        ingredientsTitles = [String](ingredientsDictionary.keys)
        ingredientsTitles = ingredientsTitles.sorted(by: { $0 < $1 })
        
        DispatchQueue.main.async {
         self.tableView?.reloadData()
            if (self.refreshControl.isRefreshing)
                {
                    self.refreshControl.endRefreshing()
                }
             }
        }
    
    func handlelookUpIngredientsByIDResponse(ingredients: LookUpIngredientsByIDResponse?, error: Error?) {
        Drinks.sharedArray.fetchedIngredients = ingredients?.Ingredients
        DispatchQueue.main.async {
         self.tableView?.reloadData()
             }
        }
    
    
    @objc func refresh(_ sender: AnyObject) {
        refresh()
    }
    
    func refresh() {
        DispatchQueue.main.async {
            self.ingredientsDictionary.removeAll()
            self.ingredientsTitles.removeAll()
            self.tableView?.reloadData()
        }
    }
}





extension IngredientsDrinkViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        return ingredientsTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell") as! DrinkCell
       // let drink =  Drinks.sharedArray.fetchedDrinks![(indexPath).row]

        let drinkKey = ingredientsTitles[indexPath.section]

        if let drinkValues = ingredientsDictionary[drinkKey] {
            cell.drinkLabel.text = drinkValues[indexPath.row].DrinkStr
            let url = URL(string: drinkValues[indexPath.row].DrinkThumbStr)
            cell.drinkImage.load(url: url!)
        }
        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Segue to the second view controller
        self.performSegue(withIdentifier: "ShowDrink", sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDrink" {
            if let destVC = segue.destination as? DrinkViewController
                {
                if let indexPath = tableView.indexPathForSelectedRow {
                          let ingredientKey = ingredientsTitles[indexPath.section]
                          if let ingredientValues = ingredientsDictionary[ingredientKey] {
                              destVC.drink = ingredientValues[indexPath.row]
            
                    }
                }
            }
        }
    }
}
