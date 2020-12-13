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
        let headerNib = UINib(nibName: String(describing: MarketReuseableView.self), bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: MarketReuseableView.self))
    }

    private func configureHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: MarketReuseableView.self), for: indexPath)
        if let marketHeaderView = headerView as? MarketReuseableView {
            marketHeaderView.configure(delegate: self)
            return marketHeaderView
        }
        return headerView
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

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return configureHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 50)
    }
}

extension MarketResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsPerRow: CGFloat = 2
        let width = collectionView.bounds.size.width/itemsPerRow - 10
        let sizeForItem = CGSize(width: width, height: 300)
        return sizeForItem
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension MarketResultsViewController: MarketReuseableViewDelegate {
    func viewOptionTapped() {
        //TODO: - Change this tempViewController thing
        guard let tempViewController = UIStoryboard(name: String(describing:StoryboardNavigation.MarketResultsViewController.rawValue), bundle: nil).instantiateViewController(withIdentifier: String(describing: MarketResultsViewController.self)) as? MarketResultsViewController else {
            return
        }
        navigationController?.pushViewController(tempViewController, animated: true)
    }
}

protocol MarketResultsViewControllerDelegate {
    func navigateToSelectedItem()
}
