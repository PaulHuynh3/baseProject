//
//  PhotoCollectionViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-16.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class PhotoCollectionViewModel {

    var delegate: PhotoCollectionViewModelDelegate?
    var uploadedPhotoType: UploadPhotoType = .placeholder
    var uploadedImages: [UIImage] = [] //TODO: Need to find a way to use placeholder with uploaded images

    func configure(delegate: PhotoCollectionViewModelDelegate) {
        self.delegate = delegate
    }

    func buildPhotoData(indexPath: IndexPath) -> UploadedImageViewCell.Data {
        return UploadedImageViewCell.Data(uploadedImage: uploadedImages[indexPath.row])
    }

    func buildPlaceHolderData() -> UploadPlaceHolderViewCell.Data {
        return UploadPlaceHolderViewCell.Data(photoTappedCallback: createPhotoTappedCallback())
    }

    private func createPhotoTappedCallback() -> (() -> Void)? {
        return { [weak self] in
            self?.delegate?.showAlert()
        }
    }

}

protocol PhotoCollectionViewModelDelegate {
    func showAlert()
}

enum UploadPhotoType {
    case placeholder
    case uploaded
}
