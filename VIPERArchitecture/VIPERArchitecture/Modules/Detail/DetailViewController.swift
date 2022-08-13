//
//  DetailViewController.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/09.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, DetailViewProtocol {
    
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var characterNameLabal: UILabel!
    @IBOutlet var quoteLabel: UILabel!
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func showQuote(forQuote quote: Quote) {
        let imageURL = URL(string: quote.image)
        characterImageView.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "hourglass"))
        characterNameLabal.text = quote.character
        quoteLabel.text = quote.quote
    }
}
