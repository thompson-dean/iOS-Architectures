//
//  MainTabBarRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/15.
//

import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    typealias Submodules = (
        quote: UIViewController,
        character: UIViewController
    )
}

extension TabBarRouter {
    
    func tabs() -> [UITabBarItem] {
        return [UITabBarItem()]
    }
}
