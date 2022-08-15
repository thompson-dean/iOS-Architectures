//
//  HomeTableViewCell.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/12.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet var quoteLabel: UILabel!
    
    func set(quote: Quote) {
        self.selectionStyle = .none
        quoteLabel.text = "\"\(quote.quote)\""
    }
}
