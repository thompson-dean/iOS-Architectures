//
//  MainRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation
import UIKit

protocol HomeRouterInterface {

    func navigateToShowDetails(id: String)
}

class HomeRouter {
    
}

extension HomeRouter: HomeRouterInterface {
    func navigateToShowDetails(id: String) {
        print(id)
    }
    
    
}
