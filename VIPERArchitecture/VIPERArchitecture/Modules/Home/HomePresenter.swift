//
//  HomePresenter.swift
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
        print("DEBUG: viewDidLoad Presenter")
        interactor?.retrieveQuotes()
    }
    
    func showQuoteDetail(forQuote quote: Quote) {
        router?.presentDetailScreen(from: view!, forQuote: quote)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func didReceiveQuotes(_ quotes: [Quote]) {
     print("DEBUG: Did Receive Quotes")
        view?.showQuotes(with: quotes)
    }
    
    func onError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
