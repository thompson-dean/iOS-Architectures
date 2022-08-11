//
//  MainPresenter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

class HomePresenter: HomePresenterProtocol {

    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveQuotes()
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func didReceiveQuotes(_ quotes: [Quote]) {
     
    }
    
    func onError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
