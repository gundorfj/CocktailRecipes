//
//  DrinksViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var ingredientsDictionary = [String: [FilterByAlcoholResponse.Drink]]()
    var ingredientsTitles = [String]()
    var ingredients: [LookUpIngredientsByIDResponse] = []
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

       refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
       refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
       tableView.addSubview(refreshControl)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ((Drinks.sharedArray.fetchedDrinks?.isEmpty) == nil || tableView.dataSource == nil)
          {
        _ = DrinksAPI.sharedInstance().filterByAlcoholRequest(alcoType: "Alcoholic", completionHandler: handleFilterByAlcoholResponse(differentDrinks:error:))
          }
    }
    
    func handleFilterByAlcoholResponse(differentDrinks: FilterByAlcoholResponse?, error: Error?) {
        Drinks.sharedArray.fetchedDrinks = differentDrinks?.Drinks?.sorted(by: { (Drink1, Drink2) -> Bool in
            let drink1 = Drink1.DrinkStr
        let drink2 = Drink2.DrinkStr
        return (drink1.localizedCaseInsensitiveCompare(drink2) == .orderedAscending)})
        
        for drink in Drinks.sharedArray.fetchedDrinks! {
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
        DispatchQueue.main.async {
            self.ingredientsDictionary.removeAll()
            self.ingredientsTitles.removeAll()
            self.tableView?.reloadData()
        }
        
        _ = DrinksAPI.sharedInstance().filterByAlcoholRequest(alcoType: "Alcoholic", completionHandler: handleFilterByAlcoholResponse(differentDrinks:error:))
    }
}





extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {

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
        self.performSegue(withIdentifier: "segueShowNavigation", sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowNavigation" {
            if let destVC = segue.destination as? UINavigationController,
                let drinkViewController = destVC.topViewController as? DrinkViewController {
             if let indexPath = tableView.indexPathForSelectedRow {
                    drinkViewController.drink = Drinks.sharedArray.fetchedDrinks![(indexPath).row]
                }
            }
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
