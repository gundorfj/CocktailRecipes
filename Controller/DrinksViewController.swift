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

    var ingredients: [LookUpIngredientsByIDResponse] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addTopBounceAreaView()
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





extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {

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
        
        let url = URL(string: drink.DrinkThumbStr)
        cell.drinkImage.load(url: url!)
        
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
