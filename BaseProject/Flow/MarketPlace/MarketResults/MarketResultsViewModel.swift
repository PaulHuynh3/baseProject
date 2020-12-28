//
//  MarketResultsViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-07.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class MarketResultsViewModel {

    var delegate: MarketResultsViewModelDelegate?
    var marketProducts = [MarketProduct]()
    var mode: MarketResultsMode = .featured

    func configure(delegate: MarketResultsViewModelDelegate, mode: MarketResultsMode) {
        self.delegate = delegate
        self.mode = mode
        marketProducts = createMarketProducts()
    }

    let mockProducts = { () -> [MarketProduct] in
        let redShoe = MarketProduct(name: "red shoe", itemNumber: 5, description: "This is just a normal red shoe", images:[ #imageLiteral(resourceName: "red-shoe")], likes: 5, views: 10, location: "undetermined")
        let brownShoe = MarketProduct(name: "brown shoe", itemNumber: 5, description: "This is just a normal brown shoe", images:[ #imageLiteral(resourceName: "brown-shoes")], likes: 10, views: 10, location: "undetermined")
        let jerseyShirt = MarketProduct(name: "jersey shirt", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "jersey-shirt")], likes: 50, views: 10, location: "undetermined")
        return [redShoe, brownShoe, jerseyShirt]
    }

    let allMockProducts = { () -> [MarketProduct] in
        let redShoe = MarketProduct(name: "red shoe", itemNumber: 5, description: "This is just a normal red shoe", images:[ #imageLiteral(resourceName: "red-shoe")], likes: 5, views: 10, location: "undetermined")
        let brownShoe = MarketProduct(name: "brown shoe", itemNumber: 5, description: "This is just a normal brown shoe", images:[ #imageLiteral(resourceName: "brown-shoes")], likes: 10, views: 10, location: "undetermined")
        let jerseyShirt = MarketProduct(name: "jersey shirt", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "jersey-shirt")], likes: 50, views: 10, location: "undetermined")
        let soccerShirt = MarketProduct(name: "soccer shirt", itemNumber: 5, description: "This is just a normal soccer shoe", images:[ #imageLiteral(resourceName: "soccer-shirt")], likes: 50, views: 10, location: "undetermined")
        let redDress = MarketProduct(name: "red dress", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "red-dress")], likes: 50, views: 10, location: "undetermined")
        let blueDress = MarketProduct(name: "blue dress", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "blue-dress")], likes: 50, views: 10, location: "undetermined")
        let pinkHeels = MarketProduct(name: "pink heels", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "pink-heels")], likes: 50, views: 10, location: "undetermined")
        return [redShoe, brownShoe, jerseyShirt, soccerShirt, redDress, blueDress, pinkHeels]
    }

    func headerSize(_ collectionView: UICollectionView) -> CGSize {
        switch mode {
        case .featured:
            return CGSize(width: collectionView.bounds.size.width, height: 50)
        case .all:
            return CGSize(width: 0, height: 0)
        }
    }

    private func createMarketProducts() -> [MarketProduct] {
        switch mode {
        case .featured:
            return mockProducts()
        case .all:
            return allMockProducts()
        }
    }
}

protocol MarketResultsViewModelDelegate {

}
