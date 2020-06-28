//
//  BaseViewController.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 28/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController
{
    override func viewWillAppear(_ animated: Bool)
    {
        CheckIfAlertIsNeeded()
    }
    

    private func CheckIfAlertIsNeeded()
    {
        if Reachability.isConnectedToNetwork() == true
        {
            print("Connected")
        }
        else
        {
            let controller = UIAlertController(title: "No Internet Detected", message: "This app requires an Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            controller.addAction(ok)
            controller.addAction(cancel)

            present(controller, animated: true, completion: nil)
        }
    }
}
