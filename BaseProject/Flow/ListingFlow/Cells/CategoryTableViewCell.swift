//
//  CategoryTableViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-02.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var subcategoryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(title: String) {
        subcategoryName.text = title
    }
}
