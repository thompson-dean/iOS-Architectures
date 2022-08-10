//
//  MainProtocols.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation

import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterQuotesProtocol {
var view: PresenterToViewQuotesProtocol? { get set }
var interactor: PresenterToInteractorQuotesProtocol? { get set }
var router: PresenterToRouterQuotesProtocol? { get set }
var quotes: [Quote] { get set }

}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewQuotesProtocol {
    
func onFetchQuotesSuccess()
    
func onFetchQuotesFailure(error: String)

}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuotesProtocol {
var presenter: InteractorToPresenterQuotesProtocol? { get set }
func loadQuotes()
func retrieveQuote(at index: Int)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuotesProtocol {

}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuotesProtocol {
}
