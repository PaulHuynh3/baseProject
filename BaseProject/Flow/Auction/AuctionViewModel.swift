//
//  AuctionViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionViewModel {

    var products = [Product]()

    var auctionItems: Int {
        return products.count
    }
    var lastContentOffset: CGFloat = 0

    func configure() {
        products = allMockProducts()
    }

    func createAuctionCells(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: AuctionTableViewCell.self, in: tableView, for: indexPath) as AuctionTableViewCell
        let product = products[indexPath.row]
        cell.configure(data: product)
        return cell
    }

    private let allMockProducts = { () -> [Product] in
        let brownShoe = Product(title: "brown shoe man", itemNumber: 5, description: "This is just a normal brown shoe", images:[#imageLiteral(resourceName: "brown-shoes"), #imageLiteral(resourceName: "red-shoe"), #imageLiteral(resourceName: "jersey-shirt")], likes: 5, views: 10, location: "undetermined", remainingTime: 172800, price: 200)
        let pinkHeels = Product(title: "pink heels", itemNumber: 5, description: "This is just some fance pink heels", images:[ #imageLiteral(resourceName: "pink-heels")], likes: 50, views: 10, location: "undetermined", remainingTime: 432000, price: 500)
        let blueDress = Product(title: "blue dress", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "blue-dress")], likes: 50, views: 10, location: "undetermined", remainingTime: 259200, price: 600)
        let jerseyShirt = Product(title: "jersey shirt", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "jersey-shirt")], likes: 50, views: 10, location: "undetermined", remainingTime: 21600, price: 1000)
        let brownyShoe = Product(title: "brown shoe", itemNumber: 5, description: "This is just a normal brown shoe", images:[ #imageLiteral(resourceName: "brown-shoes")], likes: 10, views: 10, location: "undetermined", remainingTime: 120, price: 100)
        let soccerShirt = Product(title: "soccer shirt", itemNumber: 5, description: "This is just a normal soccer shoe", images:[ #imageLiteral(resourceName: "soccer-shirt")], likes: 50, views: 10, location: "undetermined", remainingTime: 120)
        let redDress = Product(title: "red dress", itemNumber: 5, description: "This is just a normal jersey shoe", images:[ #imageLiteral(resourceName: "red-dress")], likes: 50, views: 10, location: "undetermined", remainingTime: 120)

        return [brownShoe, pinkHeels, blueDress, jerseyShirt, soccerShirt, redDress, brownyShoe]
    }
}
