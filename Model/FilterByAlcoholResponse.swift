//
//  FilterByAlcoholResponse.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 08/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

struct FilterByAlcoholResponse: Codable {

    let Drinks: [Drink]?

    enum CodingKeys: String, CodingKey {
        case Drinks = "drinks"
    }
    
    struct Drink: Codable {

        var DrinkStr : String
        var DrinkThumbStr : String
        var DrinkID : String
        var HasFavorited : Bool? = false
        var RawImage : Data?

        
        private enum CodingKeys: String, CodingKey
        {
            case DrinkStr = "strDrink"
            case DrinkThumbStr = "strDrinkThumb"
            case DrinkID = "idDrink"
        }
        
        init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            DrinkStr = try container.decodeIfPresent(String.self, forKey: .DrinkStr) ?? ""
            DrinkThumbStr = try container.decodeIfPresent(String.self, forKey: .DrinkThumbStr) ?? ""
            DrinkID = try container.decodeIfPresent(String.self, forKey: .DrinkID) ?? ""
        }
    }
}
