//
//  MainInteractor.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

protocol HomeInteractorInterface {
    func getShows(_ completion: @escaping ((Result<[Quote], Error>) -> Void))
}

final class HomeInteractor: HomeInteractorInterface {
    
    private let apiService: APIService
    
    init(apiService: APIService = .shared) {
        self.apiService = apiService
    }
    
    func getShows(_ completion: @escaping ((Result<[Quote], Error>) -> Void)) {
        apiService.fetchPosts(completion: completion)
    }

}
