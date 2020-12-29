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
        let cell = tableView.dequeue(cell: AuctionTableViewCell.self, in: tableView, for: indexPath) as AuctionTableViewCell
        
        return cell
    }

    private let allMockProducts = { () -> [MarketProduct] in
        let redShoe = MarketProduct(name: "red shoe", itemNumber: 5, description: "This is just a normal red shoe", images:[#imageLiteral(resourceName: "brown-shoes"), #imageLiteral(resourceName: "red-shoe"), #imageLiteral(resourceName: "jersey-shirt")], likes: 5, views: 10, location: "undetermined", remainingTime: 60, price: 200)
        let brownShoe = MarketProduct(name: "brown shoe", itemNumber: 5, description: "This is just a normal brown shoe", images:[ #imageLiteral(resourceName: "brown-shoes")], likes: 10, views: 10, location: "undetermined", remainingTime: 120, price: 100)
        let jerseyShirt = MarketProduct(name: "jersey shirt", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "jersey-shirt")], likes: 50, views: 10, location: "undetermined", remainingTime: 21600, price: 1000)
        let soccerShirt = MarketProduct(name: "soccer shirt", itemNumber: 5, description: "This is just a normal soccer shoe", images:[ #imageLiteral(resourceName: "soccer-shirt")], likes: 50, views: 10, location: "undetermined", remainingTime: 120)
        let redDress = MarketProduct(name: "red dress", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "red-dress")], likes: 50, views: 10, location: "undetermined", remainingTime: 120)
        let blueDress = MarketProduct(name: "blue dress", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "blue-dress")], likes: 50, views: 10, location: "undetermined")
        let pinkHeels = MarketProduct(name: "pink heels", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "pink-heels")], likes: 50, views: 10, location: "undetermined")
        return [redShoe, brownShoe, jerseyShirt, soccerShirt, redDress, blueDress, pinkHeels]
    }
}
