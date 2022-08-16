//
//  AppDelegate.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let home = TabBarController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = home
        window?.makeKeyAndVisible()
        print("DEBUG: Set root view controller")
        return true
    }
}
