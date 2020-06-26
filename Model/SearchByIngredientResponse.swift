//
//  SearchByIngredientResponse.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 17/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

struct SearchByIngredientResponse: Codable {

    let Drinks: [Drink]?

    enum CodingKeys: String, CodingKey {
        case Drinks = "drinks"
    }
    
    struct Drink: Codable {

        var DrinkStr : String
        let DrinkThumbStr : String
        let DrinkID : String

        
        private enum CodingKeys: String, CodingKey
        {
            case DrinkStr = "strDrink"
            case DrinkThumbStr = "strDrinkThumb"
            case DrinkID = "idDrink"
        }

        init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            DrinkStr = try container.decode(String.self, forKey: .DrinkStr)
            DrinkThumbStr = try container.decode(String.self, forKey: .DrinkThumbStr)
            DrinkID = try container.decode(String.self, forKey: .DrinkID)
        }
    }
}
