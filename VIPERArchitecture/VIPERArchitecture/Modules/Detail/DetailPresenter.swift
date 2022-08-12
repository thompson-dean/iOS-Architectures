//
//  DetailPresenter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    var quote: Quote?
    
    func viewDidLoad() {
        if let receivedQuote = quote {
            view?.showQuote(forQuote: receivedQuote)
        }
    }
}
