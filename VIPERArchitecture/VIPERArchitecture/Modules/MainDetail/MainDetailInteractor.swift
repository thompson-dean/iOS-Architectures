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
        print("DEBUG: Interactor Retrieve QUotes")
        apiService.fetchCharacterQuotes(character: character.name) { result in
            switch result {
            case .success(let quotes):
                print("DEBUG: Interactor success")
                self.presenter?.didReceiveQuotes(quotes)
            case .failure(let error):
                print("DEBUG: Interactor failure")
                self.presenter?.onError(error)
            }
        }
    }
}
