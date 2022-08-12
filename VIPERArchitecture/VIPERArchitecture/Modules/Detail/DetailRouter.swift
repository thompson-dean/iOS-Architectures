//
//  DetailRouter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    
    static var detailStoryboard: UIStoryboard {
        return UIStoryboard(name: "Detail", bundle: Bundle.main)
    }
    
    static func createDetailModule(forQuote quote: Quote) -> UIViewController {
        let viewController = detailStoryboard.instantiateViewController(withIdentifier: "DetailViewController")
        
        if let view = viewController as? DetailViewController {
            let presenter: DetailPresenterProtocol = DetailPresenter()
            let router: DetailRouterProtocol = DetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.quote = quote
            presenter.router = router
            
            return viewController
        }
        return UIViewController()
    }
    
}
