//
//  UploadPhotoViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-16.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class UploadPlaceHolderViewCell: UICollectionViewCell {
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var view: UIView!

    private var photoTappedCallback: (() -> Void)?
    var uploadedImage: UIImage?

    @IBAction func addPhotoTapped(_ sender: Any) {
        photoTappedCallback?()
    }

    func configure(data: Data) {
        self.photoTappedCallback = data.photoTappedCallback
        setup()
    }

    private func setup() {
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 5
    }
}

extension UploadPlaceHolderViewCell {
    struct Data {
        var photoTappedCallback: (() -> Void)?
    }
}
