//
//  LookUpCocktailByIDResponse.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 09/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation

struct LookUpCocktailByIDResponse: Codable {

    var CockTail: [CockTailData]?

    enum CodingKeys: String, CodingKey {
        case CockTail = "drinks"
    }
}


struct CockTailData: Codable {
    let DrinkID : String
    let DrinkStr : String
    let DrinkAlternateStr : String?
    let DrinkESStr : String?
    let DrinkDEStr : String?
    let DrinkFRStr : String?
    let DrinkZHHANSStr : String?
    let DrinkZHHANTStr : String?
    let TagsStr : String?
    let VideoStr : String?
    let CategoryStr : String?
    let IBAStr : String?
    let AlcoholicStr : String?
    let GlassStr : String?
    let InstructionsStr : String?
    let InstructionsESStr : String?
    let InstructionsDEStr : String?
    let InstructionsFRStr : String?
    let InstructionsZHHANSStr : String?
    let InstructionsZHHANTStr : String?
    let DrinkThumbStr : String?
    let Ingredient1Str : String?
    let Ingredient2Str : String?
    let Ingredient3Str : String?
    let Ingredient4Str : String?
    let Ingredient5Str : String?
    let Ingredient6Str : String?
    let Ingredient7Str : String?
    let Ingredient8Str : String?
    let Ingredient9Str : String?
    let Ingredient10Str : String?
    let Ingredient11Str : String?
    let Ingredient12Str : String?
    let Ingredient13Str : String?
    let Ingredient14Str : String?
    let Ingredient15Str : String?
    let Measure1Str : String?
    let Measure2Str : String?
    let Measure3Str : String?
    let Measure4Str : String?
    let Measure5Str : String?
    let Measure6Str : String?
    let Measure7Str : String?
    let Measure8Str : String?
    let Measure9Str : String?
    let Measure10Str : String?
    let Measure11Str : String?
    let Measure12Str : String?
    let Measure13Str : String?
    let Measure14Str : String?
    let Measure15Str : String?
    let CreativeCommonsConfirmedStr : String?
    let DateModifiedStr : String?


    private enum CodingKeys: String, CodingKey
    {
        case DrinkID = "idDrink"
        case DrinkStr = "strDrink"
        case DrinkAlternateStr = "strDrinkAlternate"
        case DrinkESStr = "strDrinkES"
        case DrinkDEStr = "strDrinkDE"
        case DrinkFRStr = "strDrinkFR"
        case DrinkZHHANSStr = "strDrinkZH-HANS"
        case DrinkZHHANTStr = "strDrinkZH-HANT"
        case TagsStr = "strTags"
        case VideoStr = "strVideo"
        case CategoryStr = "strCategory"
        case IBAStr = "strIBA"
        case AlcoholicStr = "strAlcoholic"
        case GlassStr = "strGlass"
        case InstructionsStr = "strInstructions"
        case InstructionsESStr = "strInstructionsES"
        case InstructionsDEStr = "strInstructionsDE"
        case InstructionsFRStr = "strInstructionsFR"
        case InstructionsZHHANSStr = "strInstructionsZH-HANS"
        case InstructionsZHHANTStr = "strInstructionsZH-HANT"
        case DrinkThumbStr = "strDrinkThumb"
        case Ingredient1Str = "strIngredient1"
        case Ingredient2Str = "strIngredient2"
        case Ingredient3Str = "strIngredient3"
        case Ingredient4Str = "strIngredient4"
        case Ingredient5Str = "strIngredient5"
        case Ingredient6Str = "strIngredient6"
        case Ingredient7Str = "strIngredient7"
        case Ingredient8Str = "strIngredient8"
        case Ingredient9Str = "strIngredient9"
        case Ingredient10Str = "strIngredient10"
        case Ingredient11Str = "strIngredient11"
        case Ingredient12Str = "strIngredient12"
        case Ingredient13Str = "strIngredient13"
        case Ingredient14Str = "strIngredient14"
        case Ingredient15Str = "strIngredient15"
        case Measure1Str = "strMeasure1"
        case Measure2Str = "strMeasure2"
        case Measure3Str = "strMeasure3"
        case Measure4Str = "strMeasure4"
        case Measure5Str = "strMeasure5"
        case Measure6Str = "strMeasure6"
        case Measure7Str = "strMeasure7"
        case Measure8Str = "strMeasure8"
        case Measure9Str = "strMeasure9"
        case Measure10Str = "strMeasure10"
        case Measure11Str = "strMeasure11"
        case Measure12Str = "strMeasure12"
        case Measure13Str = "strMeasure13"
        case Measure14Str = "strMeasure14"
        case Measure15Str = "strMeasure15"
        case CreativeCommonsConfirmedStr = "strCreativeCommonsConfirmed"
        case DateModifiedStr = "dateModified"
    }

    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        DrinkID = try container.decode(String.self, forKey: .DrinkID)
        DrinkStr = try container.decode(String.self, forKey: .DrinkStr)
        DrinkAlternateStr = try container.decodeIfPresent(String.self, forKey: .DrinkAlternateStr) ?? ""
        DrinkESStr = try container.decodeIfPresent(String.self, forKey: .DrinkESStr) ?? ""
        DrinkDEStr = try container.decodeIfPresent(String.self, forKey: .DrinkDEStr) ?? ""
        DrinkFRStr = try container.decodeIfPresent(String.self, forKey: .DrinkFRStr) ?? ""
        DrinkZHHANSStr = try container.decodeIfPresent(String.self, forKey: .DrinkZHHANSStr) ?? ""
        DrinkZHHANTStr = try container.decodeIfPresent(String.self, forKey: .DrinkZHHANTStr) ?? ""
        TagsStr = try container.decodeIfPresent(String.self, forKey: .TagsStr) ?? ""
        VideoStr = try container.decodeIfPresent(String.self, forKey: .VideoStr) ?? ""
        CategoryStr = try container.decodeIfPresent(String.self, forKey: .CategoryStr) ?? ""
        IBAStr = try container.decodeIfPresent(String.self, forKey: .IBAStr) ?? ""
        AlcoholicStr = try container.decodeIfPresent(String.self, forKey: .AlcoholicStr) ?? ""
        GlassStr = try container.decodeIfPresent(String.self, forKey: .GlassStr) ?? ""
        InstructionsStr = try container.decodeIfPresent(String.self, forKey: .InstructionsStr) ?? ""
        InstructionsESStr = try container.decodeIfPresent(String.self, forKey: .InstructionsESStr) ?? ""
        InstructionsDEStr = try container.decodeIfPresent(String.self, forKey: .InstructionsDEStr) ?? ""
        InstructionsFRStr = try container.decodeIfPresent(String.self, forKey: .InstructionsFRStr) ?? ""
        InstructionsZHHANSStr = try container.decodeIfPresent(String.self, forKey: .InstructionsZHHANSStr) ?? ""
        InstructionsZHHANTStr = try container.decodeIfPresent(String.self, forKey: .InstructionsZHHANTStr) ?? ""
        DrinkThumbStr = try container.decodeIfPresent(String.self, forKey: .DrinkThumbStr) ?? ""
        Ingredient1Str = try container.decodeIfPresent(String.self, forKey: .Ingredient1Str) ?? ""
        Ingredient2Str = try container.decodeIfPresent(String.self, forKey: .Ingredient2Str) ?? ""
        Ingredient3Str = try container.decodeIfPresent(String.self, forKey: .Ingredient3Str) ?? ""
        Ingredient4Str = try container.decodeIfPresent(String.self, forKey: .Ingredient4Str) ?? ""
        Ingredient5Str = try container.decodeIfPresent(String.self, forKey: .Ingredient5Str) ?? ""
        Ingredient6Str = try container.decodeIfPresent(String.self, forKey: .Ingredient6Str) ?? ""
        Ingredient7Str = try container.decodeIfPresent(String.self, forKey: .Ingredient7Str) ?? ""
        Ingredient8Str = try container.decodeIfPresent(String.self, forKey: .Ingredient8Str) ?? ""
        Ingredient9Str = try container.decodeIfPresent(String.self, forKey: .Ingredient9Str) ?? ""
        Ingredient10Str = try container.decodeIfPresent(String.self, forKey: .Ingredient10Str) ?? ""
        Ingredient11Str = try container.decodeIfPresent(String.self, forKey: .Ingredient11Str) ?? ""
        Ingredient12Str = try container.decodeIfPresent(String.self, forKey: .Ingredient12Str) ?? ""
        Ingredient13Str = try container.decodeIfPresent(String.self, forKey: .Ingredient13Str) ?? ""
        Ingredient14Str = try container.decodeIfPresent(String.self, forKey: .Ingredient14Str) ?? ""
        Ingredient15Str = try container.decodeIfPresent(String.self, forKey: .Ingredient15Str) ?? ""
        Measure1Str = try container.decodeIfPresent(String.self, forKey: .Measure1Str) ?? ""
        Measure2Str = try container.decodeIfPresent(String.self, forKey: .Measure2Str) ?? ""
        Measure3Str = try container.decodeIfPresent(String.self, forKey: .Measure3Str) ?? ""
        Measure4Str = try container.decodeIfPresent(String.self, forKey: .Measure4Str) ?? ""
        Measure5Str = try container.decodeIfPresent(String.self, forKey: .Measure5Str) ?? ""
        Measure6Str = try container.decodeIfPresent(String.self, forKey: .Measure6Str) ?? ""
        Measure7Str = try container.decodeIfPresent(String.self, forKey: .Measure7Str) ?? ""
        Measure8Str = try container.decodeIfPresent(String.self, forKey: .Measure8Str) ?? ""
        Measure9Str = try container.decodeIfPresent(String.self, forKey: .Measure9Str) ?? ""
        Measure10Str = try container.decodeIfPresent(String.self, forKey: .Measure10Str) ?? ""
        Measure11Str = try container.decodeIfPresent(String.self, forKey: .Measure11Str) ?? ""
        Measure12Str = try container.decodeIfPresent(String.self, forKey: .Measure12Str) ?? ""
        Measure13Str = try container.decodeIfPresent(String.self, forKey: .Measure13Str) ?? ""
        Measure14Str = try container.decodeIfPresent(String.self, forKey: .Measure14Str) ?? ""
        Measure15Str = try container.decodeIfPresent(String.self, forKey: .Measure15Str) ?? ""
        CreativeCommonsConfirmedStr = try container.decodeIfPresent(String.self, forKey: .CreativeCommonsConfirmedStr) ?? ""
        DateModifiedStr = try container.decodeIfPresent(String.self, forKey: .DateModifiedStr) ?? ""
    }
}
