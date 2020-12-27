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
        let redShoe = MarketProduct(name: "red shoe", itemNumber: 5, description: "This is just a normal red shoe", image: #imageLiteral(resourceName: "red-shoe"), likes: 5, views: 10, location: "undetermined", remainingTime: 120)
        let brownShoe = MarketProduct(name: "brown shoe", itemNumber: 5, description: "This is just a normal brown shoe", image: #imageLiteral(resourceName: "brown-shoes"), likes: 10, views: 10, location: "undetermined", remainingTime: 200)
        let jerseyShirt = MarketProduct(name: "jersey shirt", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "jersey-shirt"), likes: 50, views: 10, location: "undetermined", remainingTime: 21600)
        let soccerShirt = MarketProduct(name: "soccer shirt", itemNumber: 5, description: "This is just a normal soccer shoe", image: #imageLiteral(resourceName: "soccer-shirt"), likes: 50, views: 10, location: "undetermined", remainingTime: 120)
        let redDress = MarketProduct(name: "red dress", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "red-dress"), likes: 50, views: 10, location: "undetermined", remainingTime: 120)
        let blueDress = MarketProduct(name: "blue dress", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "blue-dress"), likes: 50, views: 10, location: "undetermined")
        let pinkHeels = MarketProduct(name: "pink heels", itemNumber: 5, description: "This is just a normal jersey shoe", image: #imageLiteral(resourceName: "pink-heels"), likes: 50, views: 10, location: "undetermined")
        return [redShoe, brownShoe, jerseyShirt, soccerShirt, redDress, blueDress, pinkHeels]
    }
}
