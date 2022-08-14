//
//  MainCollectionViewCell.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/13.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!

    func set(with character: Character) {
        label.text = character.name
        imageView.kf.setImage(with: URL(string: character.imageUrl))
        constraints()
        style()
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 16),
            contentView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func style() {
        contentView.layer.cornerRadius = 8
    }
}
