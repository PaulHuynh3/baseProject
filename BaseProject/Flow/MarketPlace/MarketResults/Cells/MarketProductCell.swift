//
//  MarketProductCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-07.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class MarketProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: Data) {
        productImage.image = data.image
        productTitle.text = data.title
    }

}

extension MarketProductCell {
    struct Data {
        let image: UIImage
        let title: String
    }
}
