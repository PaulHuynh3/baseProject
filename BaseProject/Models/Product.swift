//
//  MarketProduct.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-06.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

struct Product {
    let title: String
    let price: Int
    let images: [UIImage]
    let category: CategoryType
    let condition: Condition
    let description: String
    let location: String
    let stock: ProductStock

    let productID: String?
    let remainingTime: Int?
    let likes: Int?
    let views: Int?

    init(title: String, itemNumber: Int, description: String, images: [UIImage], likes: Int, views: Int, location: String, remainingTime: Int? = 0, price: Int = 0) {
        self.title = title
        self.description = description
        self.images = images
        self.likes = likes
        self.views = views
        self.location = location
        self.remainingTime = remainingTime
        self.price = price

        self.productID = ""
        self.category = .healthBeauty
        self.condition = .usedGood
        self.stock = .singleItem
    }
}

enum ProductStock {
    case singleItem
    case multiple
}
