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
    let IngredientStr1 : String?
    let IngredientStr2 : String?
    let IngredientStr3 : String?
    let IngredientStr4 : String?
    let IngredientStr5 : String?
    let IngredientStr6 : String?
    let IngredientStr7 : String?
    let IngredientStr8 : String?
    let IngredientStr9 : String?
    let IngredientStr10 : String?
    let IngredientStr11 : String?
    let IngredientStr12 : String?
    let IngredientStr13 : String?
    let IngredientStr14 : String?
    let IngredientStr15 : String?
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
        case IngredientStr1 = "strIngredient1"
        case IngredientStr2 = "strIngredient2"
        case IngredientStr3 = "strIngredient3"
        case IngredientStr4 = "strIngredient4"
        case IngredientStr5 = "strIngredient5"
        case IngredientStr6 = "strIngredient6"
        case IngredientStr7 = "strIngredient7"
        case IngredientStr8 = "strIngredient8"
        case IngredientStr9 = "strIngredient9"
        case IngredientStr10 = "strIngredient10"
        case IngredientStr11 = "strIngredient11"
        case IngredientStr12 = "strIngredient12"
        case IngredientStr13 = "strIngredient13"
        case IngredientStr14 = "strIngredient14"
        case IngredientStr15 = "strIngredient15"
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
        IngredientStr1 = try container.decodeIfPresent(String.self, forKey: .IngredientStr1) ?? ""
        IngredientStr2 = try container.decodeIfPresent(String.self, forKey: .IngredientStr2) ?? ""
        IngredientStr3 = try container.decodeIfPresent(String.self, forKey: .IngredientStr3) ?? ""
        IngredientStr4 = try container.decodeIfPresent(String.self, forKey: .IngredientStr4) ?? ""
        IngredientStr5 = try container.decodeIfPresent(String.self, forKey: .IngredientStr5) ?? ""
        IngredientStr6 = try container.decodeIfPresent(String.self, forKey: .IngredientStr6) ?? ""
        IngredientStr7 = try container.decodeIfPresent(String.self, forKey: .IngredientStr7) ?? ""
        IngredientStr8 = try container.decodeIfPresent(String.self, forKey: .IngredientStr8) ?? ""
        IngredientStr9 = try container.decodeIfPresent(String.self, forKey: .IngredientStr9) ?? ""
        IngredientStr10 = try container.decodeIfPresent(String.self, forKey: .IngredientStr10) ?? ""
        IngredientStr11 = try container.decodeIfPresent(String.self, forKey: .IngredientStr11) ?? ""
        IngredientStr12 = try container.decodeIfPresent(String.self, forKey: .IngredientStr12) ?? ""
        IngredientStr13 = try container.decodeIfPresent(String.self, forKey: .IngredientStr13) ?? ""
        IngredientStr14 = try container.decodeIfPresent(String.self, forKey: .IngredientStr14) ?? ""
        IngredientStr15 = try container.decodeIfPresent(String.self, forKey: .IngredientStr15) ?? ""
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
