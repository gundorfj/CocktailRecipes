//
//  FavoritesViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let nib = UINib(nibName: "DrinkCell",bundle: nil)

    @IBOutlet weak var tableView: UITableView!
    var persistenceController: PersistenceController!
    
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
        
        self.tableView.register(nib, forCellReuseIdentifier: "DrinkCell")
        
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

