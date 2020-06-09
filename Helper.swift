//
//  Helper.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 09/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class Helper
{
    static let sharedHelper = Helper()

    func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: URL) -> UIImage? {
      print("Download Started")
        var localData: Data?
        
        getData(url:url) { data, response, error in
          guard let data = data, error == nil else { return }
          print(response?.suggestedFilename ?? url.lastPathComponent)
          print("Download Finished")
        
          localData = data
//          DispatchQueue.main.async() { [weak self] in
//              self?.imageView.image = UIImage(data: data)
//          }
      }
        if localData != nil
        {
            return UIImage(data: localData!)!
        }
        else
        {
            return nil
        }
  }
}

