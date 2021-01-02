//
//  DetailedAuctionBuilder.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

class DetailedAuctionBuilder {

    var delegate: DetailedAuctionBuilderDelegate?

    func configure(delegate: DetailedAuctionBuilderDelegate) {
        self.delegate = delegate
    }

    func buildConditionData() -> DismissableData {
        return DismissableData(dismissableType: .conditionInformation,
                               tableRowHeight: 100,
                               conditionInfo: conditionInformation,
                               offer: nil
        )
    }

    private let conditionInformation = [
        ConditionInformation(subTitle: "New",
                             description: "Brand new, never worn or used, undamaged item. Ideally in the original package (if original package isn't a plastic bag or handmade item)."
        ),
        ConditionInformation(subTitle: "Used (like-new)",
                             description: "Excellent condition, but it has previously been worn or used. No signs of wear or defects."
        ),
        ConditionInformation(subTitle: "Used (good)",
                             description: "Some signs of wear. Item is operational and works as intended"
        ),
        ConditionInformation(subTitle: "Used (fair)",
                             description: "Some signs of wear and tear or minor defects. Item is still usable as intended. Includes items from households with animals or smoking (example: potential hair, stains, or smell)."
        )
    ]

    func buildOfferData(product: Product?) -> DismissableData {
        return DismissableData(dismissableType: .offer,
                               tableRowHeight: 200,
                               offer: offerInformation(product: product)
        )
    }

    private func offerInformation(product: Product?) -> OfferViewCell.Data {
        return OfferViewCell.Data(marketProduct: product,
                                offerBidConfirmCallback: createBidConfirmCallback())
    }

    private func createBidConfirmCallback() -> ((Int) -> Void)? {
        return { [weak self] price in
            self?.delegate?.updateBid(price: price)
        }
    }
}

protocol DetailedAuctionBuilderDelegate {
    func updateBid(price: Int)
}
