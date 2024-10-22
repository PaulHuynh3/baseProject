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

    private var mode: MarketResultsMode = .featured
    var viewModel = MarketResultsViewModel()
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Setup

    func configure(mode: MarketResultsMode) {
        self.mode = mode
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(delegate: self, mode: mode)
        setup()
    }

    func setup() {
        registerNib()
        setupNavigationButton()
        setupFloatingView()
    }

    lazy var floatingButton: FloatingButton = {
        let button = FloatingButton(frame: .zero)
        button.addTarget(self, action: #selector(floatingButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    @objc func floatingButtonTapped(_ button: UIButton) {
        guard let listProductViewController = UIStoryboard(name: String(describing:ListProductViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ListProductViewController.self)) as? ListProductViewController else {
            return
        }
        listProductViewController.configure(delegate: self, type: .market)
        navigationController?.pushViewController(listProductViewController, animated: true)
    }

    private func setupFloatingView() {
        view.addSubview(floatingButton)
        floatingButton.configure(title: "Post", image: UIImage(named: "add-icon"), view: view)
    }

    private func setupNavigationButton() {
        switch viewModel.mode {
        case .featured:
            navigationController?.navigationBar.topItem?.backBarButtonItem = nil
        case .all:
            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Featured Posts", style: .plain, target: nil, action: nil)
        }
    }

    private func registerNib() {
        switch viewModel.mode {
        case .featured:
            registerCollectionCells()
            registerReuseableHeaderView()
        case .all:
            registerCollectionCells()
        }
    }

    private func registerCollectionCells() {
        let nib = UINib(nibName: String(describing: MarketProductCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: MarketProductCell.self))
    }

    private func registerReuseableHeaderView() {
        let headerNib = UINib(nibName: String(describing: MarketReuseableView.self), bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: MarketReuseableView.self))
    }

    private func configureHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: MarketReuseableView.self), for: indexPath)
        if let marketHeaderView = headerView as? MarketReuseableView, viewModel.mode == .featured
            {
            marketHeaderView.configure(delegate: self)
            return marketHeaderView
        }
        return headerView
    }
}

extension MarketResultsViewController: ListProductViewControllerDelegate {
    func publishedListProduct(_ product: Product) {
        viewModel.marketProducts.append(product)
        collectionView.reloadData()
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
        marketProductCell.configure(data: MarketProductCell.Data(image: product.images.first ?? UIImage(), title: product.title))
        return marketProductCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return configureHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        viewModel.headerSize(collectionView)
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
        guard let marketViewController = UIStoryboard(name: String(describing:StoryboardNavigation.MarketResultsViewController.rawValue), bundle: nil).instantiateViewController(withIdentifier: String(describing: MarketResultsViewController.self)) as? MarketResultsViewController else {
            return
        }
        marketViewController.configure(mode: .all)
        navigationController?.pushViewController(marketViewController, animated: true)
    }
}
