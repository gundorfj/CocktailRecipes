//
//  FavoritesViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let nib = UINib(nibName: "DrinkCell",bundle: nil)

    @IBOutlet weak var tableView: UITableView!
    var persistenceController: PersistenceController!
    var favStorage: [FavoriteDrink] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Favorite Drinks"
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                               selector: #selector(yourfunction),
                               name: .favoritesChanged,
                               object: nil)
        
        // fetch request

        let fetchRequest:NSFetchRequest<FavoriteDrink> = FavoriteDrink.fetchRequest()

        if let result = try? persistenceController.viewContext.fetch(fetchRequest){
            favStorage = result
            loadTableView()
        }
        self.tableView.register(nib, forCellReuseIdentifier: "DrinkCell")
    }
    
    func loadTableView()
    {
        Drinks.sharedArray.favDrinks.removeAll()

        print("Favorites.Count: \(String(describing: favStorage.count))")

        for itm in favStorage
        {

            let decoder = JSONDecoder()
            var  drink = try! decoder.decode(FilterByAlcoholResponse.Drink.self, from: Data("{}".utf8))
                
            drink.DrinkID = itm.drinkid!
            drink.DrinkStr = itm.drinkstr!
            drink.DrinkThumbStr = itm.drinkthumbstr!
            drink.RawImage = itm.rawimage!

            print (drink)
            Drinks.sharedArray.favDrinks.append(drink)
            
        }

        
        tableView.reloadData()
    }


    struct User:Codable
    {
        var firstName:String
        var lastName:String
        var country:String

        enum CodingKeys: String, CodingKey {
            case firstName = "first_name"
            case lastName = "last_name"
            case country = "countr"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("numberOfRowsInSection Count: \(String(describing: Drinks.sharedArray.favDrinks.count))")

        return Drinks.sharedArray.favDrinks.count
    }
        
    
    @objc func yourfunction(notfication: NSNotification) {
        
        tableView.reloadData()
        
    }
    
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell") as! DrinkCell
        let drink =  Drinks.sharedArray.favDrinks[indexPath.row]

        cell.drinkLabel.text = drink.DrinkStr
        let url = URL(string: drink.DrinkThumbStr)
                
        if (drink.RawImage == nil)
        {
            cell.drinkImage.load(url: url!)
        }
        else
        {
            cell.drinkImage.image = UIImage(data: drink.RawImage!)
        }
        
        cell.accessoryView?.tintColor =  UIColor.yellow
        
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
                      drinkViewController.drink = Drinks.sharedArray.favDrinks[indexPath.row]
                }
            }
        }
    }
    
}

