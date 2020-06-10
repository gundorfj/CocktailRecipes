//
//  UITableview+extension.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 10/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit


extension UITableView {
    func addTopBounceAreaView(color: UIColor = .red) {
        var frame = UIScreen.main.bounds
        frame.origin.y = -frame.size.height

        let view = UIView(frame: frame)
        view.backgroundColor = color

        self.addSubview(view)
    }
    
}
