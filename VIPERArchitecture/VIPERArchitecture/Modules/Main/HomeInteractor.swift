//
//  MainInteractor.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor
}

class HomeInteractor: HomeInteractorInputProtocol {
    weak var presenter: HomeInteractorOutputProtocol?
    

}
