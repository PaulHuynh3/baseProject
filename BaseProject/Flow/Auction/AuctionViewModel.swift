//
//  AuctionViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionViewModel {

    var marketProducts = [MarketProduct]()

    var auctionItems: Int {
        return marketProducts.count
    }

    func configure() {
        marketProducts = allMockProducts()
    }

    func createAuctionCells(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: AuctionTableViewCell.self, in: tableView, for: indexPath)
        
        return cell
    }

    private let allMockProducts = { () -> [MarketProduct] in
        let redShoe = MarketProduct(name: "red shoe", itemNumber: 5, description: "This is just a normal red shoe", image: #imageLiteral(resourceName: "red-shoe"), numberOfLike: 5, numberOfView: 10, location: "undetermined")
        let brownShoe = MarketProduct(name: "brown shoe", itemNumber: 5, description: "This is just a normal brown shoe", image: #imageLiteral(resourceName: "brown-shoes"), numberOfLike: 10, numberOfView: 10, location: "undetermined")
        let jerseyShirt = MarketProduct(name: "jersey shirt", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "jersey-shirt"), numberOfLike: 50, numberOfView: 10, location: "undetermined")
        let soccerShirt = MarketProduct(name: "soccer shirt", itemNumber: 5, description: "This is just a normal soccer shoe", image: #imageLiteral(resourceName: "soccer-shirt"), numberOfLike: 50, numberOfView: 10, location: "undetermined")
        let redDress = MarketProduct(name: "red dress", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "red-dress"), numberOfLike: 50, numberOfView: 10, location: "undetermined")
        let blueDress = MarketProduct(name: "blue dress", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "blue-dress"), numberOfLike: 50, numberOfView: 10, location: "undetermined")
        let pinkHeels = MarketProduct(name: "pink heels", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "pink-heels"), numberOfLike: 50, numberOfView: 10, location: "undetermined")
        return [redShoe, brownShoe, jerseyShirt, soccerShirt, redDress, blueDress, pinkHeels]
    }
}
