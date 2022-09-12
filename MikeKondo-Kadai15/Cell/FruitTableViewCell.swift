//
//  FruitTableViewCell.swift
//  MikeKondo-Kadai15
//
//  Created by 近藤米功 on 2022/09/07.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    @IBOutlet private weak var fruitNameLabel: UILabel!
    @IBOutlet private weak var checkImageView: UIImageView!

    static let identifier = "fruitCell"
    static let nibName = "FruitTableViewCell"

    func configure(fruit: Fruit) {
        fruitNameLabel.text = fruit.name
        checkImageView.isHidden = !fruit.isCheck
    }
}
