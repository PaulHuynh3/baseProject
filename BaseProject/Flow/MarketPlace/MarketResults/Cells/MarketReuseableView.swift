//
//  MarketHeaderView.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-12.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class MarketReuseableView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewOptionButton: UIButton!

    var delegate: MarketReuseableViewDelegate?

    func configure(delegate: MarketReuseableViewDelegate) {
        self.delegate = delegate
    }

    @IBAction func viewOptionTapped(_ sender: Any) {
        delegate?.viewOptionTapped()
    }

}

protocol MarketReuseableViewDelegate: class {
    func viewOptionTapped()
}
