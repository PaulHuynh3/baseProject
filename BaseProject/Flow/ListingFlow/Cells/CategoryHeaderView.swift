//
//  CategoryHeaderView.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-02.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class CategoryHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLabel: UILabel!

    func configure(title: String) {
        titleLabel.text = title
    }
    
}
