//
//  Drinks.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

import Foundation
class Drinks
{
    //let fetchingNumberOfStudents: Int = 100
    static let sharedArray = Drinks()
    var fetchedIngredients: [DrinkIngredients]?
    var fetchedDrinks: [FilterByAlcoholResponse.Drink]?
    var fetchedCompleteIngrediensList: [ListIngredientsResponse.Ingredient]?
    var fetchedDrinksByIngredient: [FilterByAlcoholResponse.Drink]?
    var favDrinks: [FilterByAlcoholResponse.Drink] = []
}
