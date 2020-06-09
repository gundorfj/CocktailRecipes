//
//  LookUpIngredientsByIDResponse.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 08/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

struct LookUpIngredientsByIDResponse: Codable {

    var Ingredients: [DrinkIngredients]?

    enum CodingKeys: String, CodingKey {
        case Ingredients = "ingredients"
    }
}

struct DrinkIngredients: Codable {

     let IngredientID : String
     let IngredientStr : String
     let DescriptionStr : String
     let TypeStr : String
     let AlcoholStr : String?
     let ABVStr : String?
     
     private enum CodingKeys: String, CodingKey
     {
         case IngredientID = "idIngredient"
         case IngredientStr = "strIngredient"
         case DescriptionStr = "strDescription"
         case TypeStr = "strType"
         case AlcoholStr = "strAlcohol"
         case ABVStr = "strABV"
     }

     init(from decoder: Decoder) throws
     {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         IngredientID = try container.decode(String.self, forKey: .IngredientID)
         IngredientStr = try container.decode(String.self, forKey: .IngredientStr)
         DescriptionStr = try container.decode(String.self, forKey: .DescriptionStr)
         TypeStr = try container.decode(String.self, forKey: .TypeStr)
         AlcoholStr = try container.decodeIfPresent(String.self, forKey: .AlcoholStr) ?? ""
         ABVStr = try container.decodeIfPresent(String.self, forKey: .ABVStr) ?? ""
     }
 }

