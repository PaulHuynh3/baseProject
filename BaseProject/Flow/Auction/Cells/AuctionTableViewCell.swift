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

    func configure(data: Product) {
        productImageView.image = data.images.first
        expirationLabel.text = expirationDate(seconds: data.remainingTime ?? 0)
    }

    private func expirationDate(seconds: Int) -> String {
        let expirationDate = Date(timeIntervalSinceNow: TimeInterval(seconds))

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let formattedDate = formatter.string(from: expirationDate)
        return formattedDate
    }

}
