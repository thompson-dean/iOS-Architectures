//
//  MainDetailPresenter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/14.
//

import Foundation

class MainDetailPresenter: MainDetailPresenterProtocol {
    var character: Character?
    
    var view: MainDetailViewProtocol?
    
    var interactor: MainDetailInteractorInputProtocol?
    
    var router: MainDetailRouterProtocol?
    
    func viewDidLoad() {
        if let char = character {
            interactor?.retrieveQuotes(character: char)
            
        }
    }
    
    func showQuoteDetail(forQuote quote: Quote) {
        
    }
}

extension MainDetailPresenter: MainDetailInteractorOutputProtocol {
    func didReceiveQuotes(_ quotes: [Quote]) {
        view?.showQuotes(with: quotes)
    }
    
    func onError(_ error: Error) {
        print(error.localizedDescription)
    }
}
