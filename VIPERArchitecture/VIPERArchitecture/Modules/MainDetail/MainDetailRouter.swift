//
//  MainDetailRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/14.
//

import Foundation
import UIKit

class MainDetailRouter: MainDetailRouterProtocol {
    
    static var detailStoryboard: UIStoryboard {
        return UIStoryboard(name: "MainDetail", bundle: Bundle.main)
    }
    
    static func createMainDetailModule(forCharacter character: Character) -> UIViewController {
        let viewController = detailStoryboard.instantiateViewController(withIdentifier: "MainDetailViewController")
        
        if let view = viewController as? MainDetailViewController {
            let presenter: MainDetailPresenterProtocol & MainDetailInteractorOutputProtocol = MainDetailPresenter()
            let router: MainDetailRouterProtocol = MainDetailRouter()
            let interactor: MainDetailInteractorInputProtocol = MainDetailInteractor()
                        
            view.presenter = presenter
            presenter.view = view
            presenter.character = character
            presenter.router = router
            interactor.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
}
