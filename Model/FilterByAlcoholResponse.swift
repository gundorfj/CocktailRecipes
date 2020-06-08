//
//  FilterByAlcoholResponse.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 08/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

struct FilterByAlcoholResponse: Codable {

    let Drinks: [Drinks]?

    enum CodingKeys: String, CodingKey {
        case Drinks = "drinks"
    }
    
    struct Drinks: Codable {

        let DrinkStr : String
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
