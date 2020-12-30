//
//  AuctionTableViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var expirationLabel: UILabel!

    func configure(data: Data) {
        productImageView.image = data.product.images.first
        expirationLabel.text = String(data.product.remainingTime ?? 0)
    }

}

struct Data {
    let product: Product
}
