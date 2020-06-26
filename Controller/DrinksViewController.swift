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
 //   var persistenceController: PersistenceController!

    var refreshControl = UIRefreshControl()
    var commonIngredient: String = ""

    let nib = UINib(nibName: "DrinkCell",bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Drinks"

       refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
       refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
       tableView.addSubview(refreshControl)
        
       self.tableView.register(nib, forCellReuseIdentifier: "DrinkCell")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ((Drinks.sharedArray.fetchedDrinks?.isEmpty) == nil || tableView.dataSource == nil)
        {
            if  (commonIngredient.isEmpty)
            {
                _ = DrinksAPI.sharedInstance().filterByAlcoholRequest(alcoType: "Alcoholic", completionHandler: handleFilterByAlcoholResponse(differentDrinks:error:))
            }
            else
            {
                _ = DrinksAPI.sharedInstance().searchByIngredientRequest(ingredientType: commonIngredient, completionHandler: handleSearchByIngredientResponse(differentDrinks:error:))
            }
        }
    }
    
    func handleSearchByIngredientResponse(differentDrinks: FilterByAlcoholResponse?, error: Error?) {
        Drinks.sharedArray.fetchedDrinksByIngredient = differentDrinks?.Drinks?.sorted(by: { (Drink1, Drink2) -> Bool in
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
    
    
    
    func someMethodIwantToCall(cell: UITableViewCell) {
        let indexPathTapped = tableView.indexPath(for: cell)
        
        
        print(indexPathTapped!)
        
        let ingredientKey = ingredientsTitles[indexPathTapped!.section]
        if let ingredientValues = ingredientsDictionary[ingredientKey] {
            let drink = ingredientValues[indexPathTapped!.row]
            
            print(drink)
            
            let hasFavorited = drink.HasFavorited;
            
            if (hasFavorited == false)
            {
                Drinks.sharedArray.favDrinks.append(drink)
            }
            else
            {
                if let index = Drinks.sharedArray.favDrinks.firstIndex(where: { $0.DrinkID == drink.DrinkID })
                {
                    Drinks.sharedArray.favDrinks.remove(at: index)
                }
            }
            
            ingredientsDictionary[ingredientsTitles[indexPathTapped!.section]]![indexPathTapped!.row].HasFavorited = !hasFavorited!
            
            cell.accessoryView?.tintColor = drink.HasFavorited! ? UIColor.yellow : .lightGray
            
            NotificationCenter.default.post(name: .favoritesChanged, object: nil)
        }
    }
    
    func storeToFavorites(drink: FilterByAlcoholResponse.Drink, imageView: UIImageView)
    {
//            let favDrink = FavDrink(context: persistenceController.viewContext)
//        favDrink.drinkid = drink.DrinkID
//        favDrink.drinkstr = drink.DrinkStr
//        favDrink.images?.drinkthumbstr = drink.DrinkThumbStr
//        favDrink.images?.rawimage = imageView.image
//
//        do {
//            try persistenceController.viewContext.save()
//        }
//        catch{
//            print("error")
//        }
//        vTUserPins.append(pin)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell") as! DrinkCell
        let drinkKey = ingredientsTitles[indexPath.section]

        cell.link = self
        if let drinkValues = ingredientsDictionary[drinkKey] {
            cell.drinkLabel.text = drinkValues[indexPath.row].DrinkStr
            let url = URL(string: drinkValues[indexPath.row].DrinkThumbStr)
            cell.drinkImage.load(url: url!)
            cell.accessoryView?.tintColor = drinkValues[indexPath.row].HasFavorited! ? UIColor.yellow : .lightGray
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueShowDrinkNavigation", sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueShowDrinkNavigation" {
            if let destVC = segue.destination as? UINavigationController,
                let drinkViewController = destVC.topViewController as? DrinkViewController {
             if let indexPath = tableView.indexPathForSelectedRow {
                       let ingredientKey = ingredientsTitles[indexPath.section]
                       if let ingredientValues = ingredientsDictionary[ingredientKey] {
                           drinkViewController.drink = ingredientValues[indexPath.row]
                   }
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


extension Notification.Name {
    static let favoritesChanged = Notification.Name(
       rawValue: "favoritesChanged")
}
