//
//  ConditionViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-30.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class ConditionViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(data: Data) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
}

extension ConditionViewCell {
    struct Data {
        let title: String
        let description: String
    }
}
