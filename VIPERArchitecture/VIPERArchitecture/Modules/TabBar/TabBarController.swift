//
//  TabBarController.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/16.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let quoteVC = HomeRouter.createHomeModule()
        let characterVC = MainRouter.createHomeModule()
        
        quoteVC.tabBarItem = UITabBarItem(title: "Quotes", image: UIImage(systemName: "quote.bubble"), tag: 0)
        characterVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3"), tag: 1)
        
        self.tabBar.tintColor = .systemYellow
        
        self.setViewControllers([quoteVC, characterVC], animated: false)
    }
}
