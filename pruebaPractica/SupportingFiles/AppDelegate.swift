//
//  AppDelegate.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit
import FirebaseCore
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Cerrar"
        
        FirebaseApp.configure()
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: HomeWireFrame.createHomeModule())
        window?.makeKeyAndVisible()
        
        return true
    }

}

