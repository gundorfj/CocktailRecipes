//
//  ListIngredientsResponse.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 10/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

struct ListIngredientsResponse: Codable {

    let Ingredients: [Ingredient]?

    enum CodingKeys: String, CodingKey {
        case Ingredients = "drinks"
    }
    
    struct Ingredient: Codable {

        let IngredientStr : String
        
        private enum CodingKeys: String, CodingKey
        {
            case IngredientStr = "strIngredient1"
        }
        
        init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            IngredientStr = try container.decode(String.self, forKey: .IngredientStr)
        }
    }
}
