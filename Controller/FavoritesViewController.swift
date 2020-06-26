//
//  FavoritesViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    
    var vfavDrinks: [FavDrink] = []
    var persistenceController: PersistenceController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
