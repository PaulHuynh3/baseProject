//
//  MarketResultsViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-07.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class MarketResultsViewController: UIViewController {
    // MARK: - Properties

    let viewModel = MarketResultsViewModel()
    var delegate: MarketResultsViewControllerDelegate?
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Setup

    func configure(delegate: MarketResultsViewControllerDelegate) {
        self.delegate = delegate
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(delegate: self)
        registerNibForCollection()
    }

    private func registerNibForCollection() {
        let nib = UINib(nibName: String(describing: MarketProductCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: MarketProductCell.self))
    }
}

extension MarketResultsViewController: MarketResultsViewModelDelegate {

}

extension MarketResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.marketProducts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let marketProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MarketProductCell.self), for: indexPath) as? MarketProductCell else {
            fatalError("Could not DequeingReuseableCell for MarketProductCell")
        }
        let product = viewModel.marketProducts[indexPath.row]
        marketProductCell.configure(data: MarketProductCell.Data(image: product.image, title: product.name))
        return marketProductCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension MarketResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let itemsPerRow: CGFloat = 2
        let width = collectionView.bounds.size.width/itemsPerRow - 15
        let sizeForItem = CGSize(width: width, height: 300)
        return sizeForItem
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

protocol MarketResultsViewControllerDelegate {
    func navigateToSelectedItem()
}
