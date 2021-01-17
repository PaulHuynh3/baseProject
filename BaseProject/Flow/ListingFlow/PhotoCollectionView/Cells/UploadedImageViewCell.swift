//
//  UploadedImageViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-17.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class UploadedImageViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var uploadedImageView: UIImageView!

    func configure(data: Data) {
        uploadedImageView.image = data.uploadedImage
        setup()
    }

    private func setup() {
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 5
    }
}

extension UploadedImageViewCell {
    struct Data {
        var uploadedImage: UIImage?
    }
}
