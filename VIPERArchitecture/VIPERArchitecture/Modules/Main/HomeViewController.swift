//
//  MainView.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import UIKit


protocol HomeViewInterface {
    func reloadData()
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterInterface!
    
    
    @IBOutlet var homeTableView: UITableView! {
        didSet {
            homeTableView.delegate = self
            homeTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadQuotes()
    
    }
}

extension HomeViewController: HomeViewInterface {
    func reloadData() {
        homeTableView.reloadData()
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.item(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = item.quote
        
        return cell
    }
    
    
}


