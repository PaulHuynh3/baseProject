//
//  AuctionPictureTableViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-27.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionPictureCollectionController: UIViewController {

    let viewModel = AuctionPictureViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell()
    }

    func configure(data: MarketProduct?) {
        viewModel.configure(delegate: self, data: data)
        configurePageControl()
    }

    private func configurePageControl() {
        pageControl.numberOfPages = viewModel.marketProduct?.images.count ?? 0
        pageControl.hidesForSinglePage = true
    }

    private func registerCollectionCell() {
        let nib = UINib(nibName: String(describing: AuctionPicturesCollectionCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: AuctionPicturesCollectionCell.self))
    }
}

extension AuctionPictureCollectionController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.marketProduct?.images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AuctionPicturesCollectionCell.self), for: indexPath) as? AuctionPicturesCollectionCell else {
            fatalError("AuctionPicturesCollectionController cellForItem is broken.")
        }

        cell.configure(image: viewModel.marketProduct?.images[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}

extension AuctionPictureCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.frame.size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension AuctionPictureCollectionController: AuctionPictureViewModelDelegate {
    func reloadTableView() {
//        tableView.reloadData()
    }
}
