//
//  ConditionHeaderView.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-30.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class ConditionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    var exitButtonCallback: (() -> Void)?

    func configure(data: Data) {
        titleLabel.text = data.title
        self.exitButtonCallback = data.exitButtonCallback
    }

    @IBAction func exitButtonTapped(_ sender: Any) {
        exitButtonCallback?()
    }
}

extension ConditionHeaderView {
    struct Data {
        let title: String
        let exitButtonCallback: (() -> Void)?
    }
}
