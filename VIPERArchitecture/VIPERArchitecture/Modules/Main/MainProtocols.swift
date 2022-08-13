//
//  MainProtocols.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/13.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    
    // Presenter ->  View functions
    func showQuotes(with quotes: [Quote])
}

protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor functions
    func retrieveQuotes()
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    // View -> Presenter functions
    func viewDidLoad()
    func showCharacterDetail(forQuote character: Character)
}

protocol MainInteractorOutputProtocol: AnyObject {
    // Interactor -> Presenter functions
    func didReceiveCharacters(_ characters: [Character])
    func onError(_ error: Error)
}

protocol MainRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    
    // Presenter -> Router functions
}
