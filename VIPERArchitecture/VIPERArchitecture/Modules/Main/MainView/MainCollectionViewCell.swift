//
//  MainCollectionViewCell.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/13.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var label: UILabel!
    
    func set(with character: Character) {
        contentView.layer.cornerRadius = 10
        imageView.kf.setImage(with: URL(string: character.imageUrl), placeholder: UIImage(systemName: "pencil"))
        label.text = character.name
    }
}
