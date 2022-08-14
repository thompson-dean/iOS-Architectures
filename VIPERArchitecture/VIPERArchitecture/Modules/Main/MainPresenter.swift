//
//  MainPresenter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/13.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
    
    func viewDidLoad() {
        
    }
    
    func showCharacterDetail(forQuote character: Character) {
        router?.presentDetailScreen(from: view!, forCharacter: character)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    func didReceiveCharacters(_ characters: [Character]) {
        
    }
    
    func onError(_ error: Error) {
        print(error.localizedDescription)
    } 
}
