//
//  MainDetailViewController.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/14.
//

import UIKit

class MainDetailViewController: UIViewController, MainDetailViewProtocol {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var presenter: MainDetailPresenterProtocol?
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        presenter?.viewDidLoad()
    }
    
    func showQuotes(with quotes: [Quote]) {
        self.quotes = quotes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showCharacter(with character: Character) {
        imageView.kf.setImage(with: URL(string: character.imageUrl))
        label.text = character.name
    }
}

extension MainDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension MainDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainDetailTableViewCell", for: indexPath) as? MainDetailTableViewCell else { return UITableViewCell() }
        
        return cell
        
    }
}
