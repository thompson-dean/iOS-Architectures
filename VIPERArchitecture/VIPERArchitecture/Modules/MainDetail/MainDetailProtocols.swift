//
//  MainDetailProtocols.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/14.
//

import UIKit

protocol MainDetailViewProtocol: AnyObject {
    var presenter: MainDetailPresenterProtocol? { get set }
    
    // Presenter ->  View functions
    func showQuotes(with quotes: [Quote])
    func showCharacter(with character: Character)
}

protocol MainDetailInteractorInputProtocol: AnyObject {
    var presenter: MainDetailInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor functions
    func retrieveQuotes(character: Character) 
}

protocol MainDetailPresenterProtocol: AnyObject {
    var view: MainDetailViewProtocol? { get set }
    var interactor: MainDetailInteractorInputProtocol? { get set }
    var router: MainDetailRouterProtocol? { get set }
    var character: Character? { get set }
    
    // View -> Presenter functions
    func viewDidLoad()
}

protocol MainDetailInteractorOutputProtocol: AnyObject {
    // Interactor -> Presenter functions
    func didReceiveQuotes(_ quotes: [Quote])
    func onError(_ error: Error)
}

protocol MainDetailRouterProtocol: AnyObject {
    static func createMainDetailModule(forCharacter character: Character) -> UIViewController
    
    // Presenter -> Router functions
}
