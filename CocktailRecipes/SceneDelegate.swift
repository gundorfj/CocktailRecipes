//
//  SceneDelegate.swift
//  CocktailRecipes
//
//  Created by Jan Gundorf on 07/06/2020.
//  Copyright © 2020 Jan Gundorf. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let persistenceController = PersistenceController(modelName:"CocktailRecipes")


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        persistenceController.load()
    
        guard let mainTabBarVC: UITabBarController = self.window!.rootViewController as? UITabBarController else {fatalError()}
        guard let navControllerOne = mainTabBarVC.viewControllers![0] as? UINavigationController else { fatalError() }
        guard let navControllerTwo = mainTabBarVC.viewControllers![1] as? UINavigationController else { fatalError() }
        guard let navControllerThree = mainTabBarVC.viewControllers![2] as? UINavigationController else { fatalError() }
        guard let drinksVC = navControllerOne.topViewController as? DrinksViewController else { fatalError() }
        guard let favoritesVC = navControllerTwo.topViewController as? FavoritesViewController else { fatalError() }
        guard let ingredientsVC = navControllerThree.topViewController as? IngredientsViewController else { fatalError() }

        ingredientsVC.persistenceController = persistenceController
        favoritesVC.persistenceController = persistenceController
        drinksVC.persistenceController = persistenceController

        guard let _ = (scene as? UIWindowScene) else { return }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

