//
//  MainPresenter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    // View -> Presenter functions
    
}

protocol HomeInteractorOutputProtocol {
    // Interactor -> Presenter functions
    func didReceiveQuotes(_ quotes: [Quote])
    func onError()
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    
    var interactor: HomeInteractorInputProtocol?
    
    var router: HomeRouterProtocol?
    

}

extension HomePresenter: HomeInteractorOutputProtocol {
    func didReceiveQuotes(_ quotes: [Quote]) {
        
    }
    
    func onError() {
        
    }
    
    
}

