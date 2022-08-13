//
//  HomeProtocols.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/11.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    // Presenter ->  View functions
    func showQuotes(with quotes: [Quote])
}

protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor functions
    func retrieveQuotes()
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    // View -> Presenter functions
    func viewDidLoad()
    func showQuoteDetail(forQuote quote: Quote)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    // Interactor -> Presenter functions
    func didReceiveQuotes(_ quotes: [Quote])
    func onError(_ error: Error)
}

protocol HomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    
    // Presenter -> Router functions
    func presentDetailScreen(from view: HomeViewProtocol, forQuote quote: Quote)
}
