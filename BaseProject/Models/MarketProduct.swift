//
//  MarketProduct.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-06.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

struct MarketProduct {
    let name: String
    let itemNumber: Int
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int
    let location: String
    let remainingTime: Int?

    init(name: String, itemNumber: Int, description: String, image: UIImage, likes: Int, views: Int, location: String, remainingTime: Int? = 0) {
        self.name = name
        self.itemNumber = itemNumber
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
        self.location = location
        self.remainingTime = remainingTime
    }
}
