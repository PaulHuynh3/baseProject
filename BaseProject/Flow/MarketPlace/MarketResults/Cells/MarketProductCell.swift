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
//        productImage.image = resizedImage(at: data.image, for: CGSize(width: 300, height: 300))
        productImage.image = data.image
        productTitle.text = data.title
    }

    func resizedImage(at image: UIImage, for size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

extension MarketProductCell {
    struct Data {
        let image: UIImage
        let title: String
    }
}
