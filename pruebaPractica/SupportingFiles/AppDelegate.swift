//
//  AppDelegate.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("///////'")
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: HomeWireFrame.createHomeModule())
        window?.makeKeyAndVisible()
        
        return true
    }

}

