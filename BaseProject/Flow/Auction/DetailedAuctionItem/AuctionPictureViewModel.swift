//
//  AuctionPictureViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-27.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

class AuctionPictureViewModel {

    var marketProduct: MarketProduct?
    var delegate: AuctionPictureViewModelDelegate?

    func configure(delegate: AuctionPictureViewModelDelegate?, data: MarketProduct?) {
        self.marketProduct = data
    }

}

protocol AuctionPictureViewModelDelegate {
    func reloadTableView()
}
