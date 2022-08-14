//
//  MainRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/13.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    static var homeStoryboard: UIStoryboard {
        UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createHomeModule() -> UIViewController {
        print("DEBUG: Set Nav")
        let navController = homeStoryboard.instantiateViewController(withIdentifier: "MainNavigationViewController")
        
        if let view = navController.children.first as? MainViewController {
            print("DEBUG: Set child")
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
            let interactor: MainInteractorInputProtocol = MainInteractor()
            let router: MainRouterProtocol = MainRouter()
            
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
    
    func presentDetailScreen(from view: HomeViewProtocol, forCharacter character: Character) {
        let detailViewController = MainDetailRouter.createMainDetailModule(forCharacter: character)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
