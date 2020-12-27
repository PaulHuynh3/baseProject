//
//  AuctionTableHeaderView.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionTableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!

    override func awakeFromNib() {
        hammerRotationAnimation()
    }

    private func hammerRotationAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            self.titleImageView.transform = CGAffineTransform(rotationAngle: .pi/2.5)
        }) { isFinished in
            UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                self.titleImageView.transform = .identity
            })
        }
    }
}
