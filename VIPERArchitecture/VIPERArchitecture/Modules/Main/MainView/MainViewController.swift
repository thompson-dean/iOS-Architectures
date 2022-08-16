//
//  MainViewController.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/13.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    var presenter: MainPresenterProtocol?
    
    @IBOutlet var collectionView: UICollectionView!
    
    var characters: [Character] = CharactersService.shared.characters
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showCharacterDetail(forQuote: characters[indexPath.row])
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionCell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        let character = characters[indexPath.row]
        cell.set(with: character)
        return cell
    }
}
