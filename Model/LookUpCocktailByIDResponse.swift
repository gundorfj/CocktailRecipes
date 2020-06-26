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
    var Keys:[String]?
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
    let MeasureStr1 : String?
    let MeasureStr2 : String?
    let MeasureStr3 : String?
    let MeasureStr4 : String?
    let MeasureStr5 : String?
    let MeasureStr6 : String?
    let MeasureStr7 : String?
    let MeasureStr8 : String?
    let MeasureStr9 : String?
    let MeasureStr10 : String?
    let MeasureStr11 : String?
    let MeasureStr12 : String?
    let MeasureStr13 : String?
    let MeasureStr14 : String?
    let MeasureStr15 : String?
    let CreativeCommonsConfirmedStr : String?
    let DateModifiedStr : String?


    private enum CodingKeys: String, CaseIterable, CodingKey
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
        case CreativeCommonsConfirmedStr = "strCreativeCommonsConfirmed"
        case DateModifiedStr = "dateModified"
    }
    
    private enum IngredientsCodingKeys: String, CodingKey
    {
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
        case MeasureStr1 = "strMeasure1"
        case MeasureStr2 = "strMeasure2"
        case MeasureStr3 = "strMeasure3"
        case MeasureStr4 = "strMeasure4"
        case MeasureStr5 = "strMeasure5"
        case MeasureStr6 = "strMeasure6"
        case MeasureStr7 = "strMeasure7"
        case MeasureStr8 = "strMeasure8"
        case MeasureStr9 = "strMeasure9"
        case MeasureStr10 = "strMeasure10"
        case MeasureStr11 = "strMeasure11"
        case MeasureStr12 = "strMeasure12"
        case MeasureStr13 = "strMeasure13"
        case MeasureStr14 = "strMeasure14"
        case MeasureStr15 = "strMeasure15"
    }

    

    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let ingredientsContainer = try decoder.container(keyedBy: IngredientsCodingKeys.self)

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
        IngredientStr1 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr1) ?? ""
        IngredientStr2 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr2) ?? ""
        IngredientStr3 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr3) ?? ""
        IngredientStr4 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr4) ?? ""
        IngredientStr5 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr5) ?? ""
        IngredientStr6 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr6) ?? ""
        IngredientStr7 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr7) ?? ""
        IngredientStr8 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr8) ?? ""
        IngredientStr9 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr9) ?? ""
        IngredientStr10 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr10) ?? ""
        IngredientStr11 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr11) ?? ""
        IngredientStr12 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr12) ?? ""
        IngredientStr13 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr13) ?? ""
        IngredientStr14 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr14) ?? ""
        IngredientStr15 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .IngredientStr15) ?? ""
        MeasureStr1 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr1) ?? ""
        MeasureStr2 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr2) ?? ""
        MeasureStr3 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr3) ?? ""
        MeasureStr4 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr4) ?? ""
        MeasureStr5 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr5) ?? ""
        MeasureStr6 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr6) ?? ""
        MeasureStr7 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr7) ?? ""
        MeasureStr8 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr8) ?? ""
        MeasureStr9 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr9) ?? ""
        MeasureStr10 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr10) ?? ""
        MeasureStr11 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr11) ?? ""
        MeasureStr12 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr12) ?? ""
        MeasureStr13 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr13) ?? ""
        MeasureStr14 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr14) ?? ""
        MeasureStr15 = try ingredientsContainer.decodeIfPresent(String.self, forKey: .MeasureStr15) ?? ""
        CreativeCommonsConfirmedStr = try container.decodeIfPresent(String.self, forKey: .CreativeCommonsConfirmedStr) ?? ""
        DateModifiedStr = try container.decodeIfPresent(String.self, forKey: .DateModifiedStr) ?? ""
    }
}
