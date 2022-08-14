//
//  MainDetailTableViewCell.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/14.
//

import UIKit

class MainDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    
    func set(quote: Quote) {
        label.text = "\(quote.quote)"
    }
}
