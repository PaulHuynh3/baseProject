//
//  AuctionPicturesTableViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-27.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionPicturesCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!

    func configure(image: UIImage?) {
        itemImageView.image = image
    }
}
