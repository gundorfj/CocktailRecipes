//
//  DrinksAPI.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//


//// List by
//    //Category
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/list.php?c=list")! as URL,
//    //Glasses
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/list.php?g=list")! as URL,
//    //Ingredients
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/list.php?i=list")! as URL,
//    // Alcohol Filters
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/list.php?a=list")! as URL,
//
////Lookup
//    //By ingredient
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/lookup.php?iid=552")! as URL,
//    // Random cocktail
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/random.php")! as URL,
//    // Full cocktail by ID
//    let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/lookup.php?i=11007")! as URL,
//
//

import Foundation
import UIKit

class DrinksAPI {

    // MARK: Cocktail Constants
    struct Constants {
        static let CocktailScheme = "https"
        static let CocktailHost = "the-cocktail-db.p.rapidapi.com"
        static let CocktailUrl = CocktailScheme + "://" + CocktailHost
    }

    // MARK: Cocktail Path Values
    struct CocktailPathValue {
        static let Lookup = "/lookup.php"
        static let Filter = "/filter.php"
        static let Search = "/search.php"
        static let List = "/list.php"
        static let Random = "/random.php"
    }
    
    
    // MARK: Cocktail Parameter Values
    struct CocktailParameterValues {
        static let APIKey = "8c86334366msh84a8a82fa20d6b5p14d348jsna4fd98654ad2"
        static let ResponseFormat = "json"
        static let TimeoutInterval = 10.0
    }
    
    
    enum Endpoint {
        case filterByGlass(String)
        case filterByAlcohol(String)
        case filterByCategory(String)
        case searchIngredientByName(String)
        case searchCocktailByName(String)
        case searchByIngredient(String)
        case listByCategory
        case listByGlasses
        case listByIngredients
        case listByAlcohol
        case lookUpIngredient(Int)
        case lookUpRandomCocktail
        case lookUpCocktailByID(Int)

        var url: URL {
            return URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
            case .filterByGlass(let glass):
                return Constants.CocktailUrl + CocktailPathValue.Filter + "?c=\(glass)"
            case .filterByAlcohol(let alcoType):
                return Constants.CocktailUrl + CocktailPathValue.Filter + "?a=\(alcoType)"
            case .filterByCategory(let category):
                return Constants.CocktailUrl + CocktailPathValue.Filter + "?c=\(category)"
            case .searchIngredientByName(let ingredientName):
                return Constants.CocktailUrl + CocktailPathValue.Search + "?i=\(ingredientName)"
            case .searchCocktailByName(let cocktail):
                return Constants.CocktailUrl + CocktailPathValue.Search + "?i=\(cocktail)"
            case .searchByIngredient(let ingredient):
                return Constants.CocktailUrl + CocktailPathValue.Filter + "?i=\(ingredient)"
            case .listByCategory:
                return Constants.CocktailUrl + CocktailPathValue.List + "?c=list"
            case .listByGlasses:
                return Constants.CocktailUrl + CocktailPathValue.List + "?g=list"
            case .listByIngredients:
                return Constants.CocktailUrl + CocktailPathValue.List + "?i=list"
            case .listByAlcohol:
                return Constants.CocktailUrl + CocktailPathValue.List + "?a=list"
            case .lookUpIngredient(let ingredientID):
                return Constants.CocktailUrl + CocktailPathValue.Lookup + "?iid=\(ingredientID)"
            case .lookUpRandomCocktail:
                return Constants.CocktailUrl + CocktailPathValue.Random
            case .lookUpCocktailByID(let cocktailID):
                return Constants.CocktailUrl + CocktailPathValue.Lookup + "?i=\(cocktailID)"
            }
        }
    }
    
    
    
    
    // MARK: Shared Instance
    class func sharedInstance() -> DrinksAPI {
        struct Singleton {
            static var sharedInstance = DrinksAPI()
        }
        return Singleton.sharedInstance
    }

    
    private func createDrinksRequest(MyUrl : URL) -> NSMutableURLRequest
    {
        let request = NSMutableURLRequest(url: MyUrl)
        let headers = ["x-rapidapi-host": Constants.CocktailHost,  "x-rapidapi-key": CocktailParameterValues.APIKey]
        request.cachePolicy = .useProtocolCachePolicy
        request.timeoutInterval = CocktailParameterValues.TimeoutInterval
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
    
    
    func filterByAlcoholRequest(alcoType: String, completionHandler: @escaping (FilterByAlcoholResponse?, Error?) -> Void) {

        let request = createDrinksRequest(MyUrl: Endpoint.filterByAlcohol(alcoType).url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            let alcoholDrinks = try! decoder.decode(FilterByAlcoholResponse.self, from: data)
            completionHandler(alcoholDrinks, nil)
        }
        task.resume()
    }

    func lookUpIngredientsByIDRequest(id: Int, completionHandler: @escaping (LookUpIngredientsByIDResponse?, Error?) -> Void) {

        let request = createDrinksRequest(MyUrl: Endpoint.lookUpIngredient(id).url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            let ingredientsByID = try! decoder.decode(LookUpIngredientsByIDResponse.self, from: data)
            completionHandler(ingredientsByID, nil)
        }
        task.resume()
    }
    
    func listIngredientsRequest(completionHandler: @escaping (ListIngredientsResponse?, Error?) -> Void) {

        let request = createDrinksRequest(MyUrl: Endpoint.listByIngredients.url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            let ingredientsList = try! decoder.decode(ListIngredientsResponse.self, from: data)
            completionHandler(ingredientsList, nil)
        }
        task.resume()
    }
    
    func lookUpCocktailByIDRequest(id: Int, completionHandler: @escaping (LookUpCocktailByIDResponse?, Error?) -> Void) {

        let request = createDrinksRequest(MyUrl: Endpoint.lookUpCocktailByID(id).url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            let cocktailByID = try! decoder.decode(LookUpCocktailByIDResponse.self, from: data)
            completionHandler(cocktailByID, nil)
        }
        task.resume()
    }
}
