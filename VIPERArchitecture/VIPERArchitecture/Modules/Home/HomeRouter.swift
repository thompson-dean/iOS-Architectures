//
//  MainRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    static var homeStoryboard: UIStoryboard {
        UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createHomeModule() -> UIViewController {
        let navController = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        
        if let view = navController.children.first as? HomeViewController {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol = HomeInteractor()
            let router: HomeRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
}
