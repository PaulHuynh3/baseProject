//
//  PhotoCollectionViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-16.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = PhotoCollectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        viewModel.configure(delegate: self)
    }

    func configure() {
        //get my data if i need it
    }
//need to scroll to last item self?.collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    private func registerNib() {
        let nib = UINib(nibName: String(describing: UploadPlaceHolderViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: UploadPlaceHolderViewCell.self))

        let imageNib = UINib(nibName: String(describing: UploadedImageViewCell.self), bundle: nil)
        collectionView.register(imageNib, forCellWithReuseIdentifier: String(describing: UploadedImageViewCell.self))
    }
}

extension PhotoCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + viewModel.uploadedImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.uploadedPhotoType {
        case .placeholder:
            if indexPath.row == 0 {
                guard let uploadPhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UploadPlaceHolderViewCell.self), for: indexPath) as? UploadPlaceHolderViewCell else { fatalError() }
                uploadPhotoCell.configure(data: viewModel.buildPlaceHolderData())
                return uploadPhotoCell
            }
            guard let uploadedImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UploadedImageViewCell.self), for: indexPath) as? UploadedImageViewCell else { fatalError() }
            uploadedImageCell.configure(data: viewModel.buildPhotoData(indexPath: indexPath))
            return uploadedImageCell
        case .uploaded:
            //Access the last item in the collectionView
            if indexPath.row == viewModel.uploadedImages.count {
                guard let uploadPhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UploadPlaceHolderViewCell.self), for: indexPath) as? UploadPlaceHolderViewCell else { fatalError() }
                uploadPhotoCell.configure(data: viewModel.buildPlaceHolderData())
                return uploadPhotoCell
            }
            guard let uploadedImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UploadedImageViewCell.self), for: indexPath) as? UploadedImageViewCell else { fatalError() }
            uploadedImageCell.configure(data: viewModel.buildPhotoData(indexPath: indexPath))
            return uploadedImageCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row == 0 else { return }
        print("hello")
    }
}

extension PhotoCollectionViewController: PhotoCollectionViewModelDelegate {
    func getImageFrom(source: UIImagePickerController.SourceType) {
        getImage(fromSourceType: source)
    }

    func showAlert() {
        showActionSheet()
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModel.uploadedPhotoType {
        case .placeholder:
            return view.frame.size
        case .uploaded:
            return indexPath.row == viewModel.uploadedImages.count
            ? CGSize(width: view.frame.width/2, height: view.frame.height)
            : CGSize(width: view.frame.width/3, height: view.frame.height)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PhotoCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showActionSheet() {
        self.present(viewModel.buildGetImageActionSheet(), animated: true, completion: nil)
     }

    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            self.viewModel.uploadedImages.append(image)
            self.viewModel.uploadedPhotoType = .uploaded

            self.collectionView.reloadData()
            self.collectionView.performBatchUpdates(nil, completion: { _ in
                //Finish reloading Data
                self.collectionView.scrollToItem(at: IndexPath(row: self.viewModel.uploadedImages.count, section: 0), at: .right, animated: true)
            })
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
