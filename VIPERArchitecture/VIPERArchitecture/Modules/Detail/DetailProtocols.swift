//
//  DetailProtocols.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/12.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW functions
    func showQuote(forQuote quote: Quote)
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    var quote: Quote? { get set }
    
    // VIEW -> PRESENTER functions
    func viewDidLoad()
}

protocol DetailRouterProtocol: AnyObject {
    static func createDetailModule(forQuote quote: Quote) -> UIViewController
}
