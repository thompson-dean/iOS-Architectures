//
//  MainView.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    let apiService = APIService()
    
    @IBOutlet var homeTableView: UITableView!
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("VIEWDIDLOAD")
        apiService.fetchPosts { quotes in
            DispatchQueue.main.async {
                self.quotes = quotes
                self.homeTableView.reloadData()
            }

        }
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = quotes[indexPath.row].quote
        
        return cell
    }
    
    
}


