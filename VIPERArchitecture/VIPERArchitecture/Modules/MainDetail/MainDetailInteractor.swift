//
//  MainDetailInteractor.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/14.
//

import Foundation

class MainDetailInteractor: MainDetailInteractorInputProtocol {
    
    var presenter: MainDetailInteractorOutputProtocol?
    
    let apiService: APIService
    
    init(apiService: APIService = .shared) {
        self.apiService = apiService
    }
    
    func retrieveQuotes(character: Character) {
        apiService.fetchCharacterQuotes(character: character.name) { result in
            switch result {
            case .success(let quotes):
                self.presenter?.didReceiveQuotes(quotes)
            case .failure(let error):
                self.presenter?.onError(error)
            }
        }
    }
}
