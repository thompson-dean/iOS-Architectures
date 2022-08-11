//
//  MainPresenter.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import Foundation


protocol HomePresenterInterface{
    var numberOfItems: Int { get }
    
    func item(at indexPath: IndexPath) -> Quote
    func itemSelected(at indexPath: IndexPath)
    func loadQuotes()
}

final class HomePresenter {
    
    //MARK: - Properties
    
    private let view: HomeViewInterface
    private let interactor: HomeInteractorInterface
//    private let wireframe: HomeWireframeInterface

    private var items: [Quote] = [] {
        didSet {
            view.reloadData()
        }
    }

    
    //MARK: - Lifecycle
    init(
        view: HomeViewInterface,
        interactor: HomeInteractorInterface
//        wireframe: HomeWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
//        self.wireframe = wireframe
    }

}

//MARK: - extensions

extension HomePresenter: HomePresenterInterface {
    var numberOfItems: Int {
        items.count
    }

    func item(at indexPath: IndexPath) -> Quote {
        items[indexPath.row]
    }

    func itemSelected(at indexPath: IndexPath) {
        let quote = items[indexPath.row]
        print(quote)
    }

    func loadQuotes() {
        interactor.getShows { result in
            switch result {
                
            case .success(let quotes):
                self.items = quotes
            case .failure(let error):
                print(error)
            }
        }
    }
}


