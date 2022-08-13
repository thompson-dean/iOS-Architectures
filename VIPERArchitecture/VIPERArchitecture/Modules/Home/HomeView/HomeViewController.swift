//
//  HomeViewController.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    @IBOutlet var homeTableView: UITableView!
    
    var presenter: HomePresenterProtocol?
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: viewDidLoad Controller")
        presenter?.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 60
    }
    
    func showQuotes(with quotes: [Quote]) {
        print("DEBUG: show Quotes")
        self.quotes = quotes
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
        }
    }
}

// TABLE VIEW DELEGATE
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let quote = quotes[indexPath.row]
        presenter?.showQuoteDetail(forQuote: quote)
    }
}

// TABLE VIEW DATASOURCE
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }

        let quote = quotes[indexPath.row]
        cell.set(quote: quote)
        
        return cell
    }
    
}
