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
        
        for itm in favStorage
        {
            var drk : FilterByAlcoholResponse.Drink!
            drk.DrinkID = itm.drinkid!
            drk.DrinkStr = itm.drinkstr!
            drk.DrinkThumbStr = itm.drinkthumbstr!
            drk.HasFavorited = true;

            Drinks.sharedArray.favDrinks.append(drk)
        }
        tableView.reloadData()
    }
    
    
    func storeDrink()
    {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
        cell.drinkImage.load(url: url!)
        cell.accessoryView?.tintColor =  UIColor.yellow
        
        return cell
    }
    
}

