//
//  HomeInteractor.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    weak var presenter: HomeInteractorOutputProtocol?
    
    let apiService: APIService
    
    init(apiService: APIService = .shared) {
        self.apiService = apiService
    }
    
    func retrieveQuotes() {
        print("DEBUG: retreive Quotes")
        apiService.fetchQuotes { result in
            switch result {
            case .success(let quotes):
                self.presenter?.didReceiveQuotes(quotes)
            case .failure(let error):
                self.presenter?.onError(error)
            }
        }
    }
    
}
