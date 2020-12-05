//
//  BurgerTableViewCell.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-18.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class BurgerMenuCell: UITableViewCell {
    @IBOutlet weak var menuLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(data: Data) {
        menuLabel.text = data.menuName
    }

    struct Data {
        let menuName: String?
    }
    
}
