//
//  HomeRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {

    static var homeStoryboard: UIStoryboard {
        UIStoryboard(name: "Home", bundle: Bundle.main)
    }
    
    static func createHomeModule() -> UIViewController {
        print("DEBUG: Set Nav")
        let navController = homeStoryboard.instantiateViewController(withIdentifier: "HomeNavigationController")
        
        if let view = navController.children.first as? HomeViewController {
            print("DEBUG: Set child")
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol = HomeInteractor()
            let router: HomeRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            print("DEBUG: Set child and routed dependencies")
            return navController
        }
        print("DEBUG: Did not set child")
        return UIViewController()
    }
    
    func presentDetailScreen(from view: HomeViewProtocol, forQuote quote: Quote) {
        let detailViewController = DetailRouter.createDetailModule(forQuote: quote)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
