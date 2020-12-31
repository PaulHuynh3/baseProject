//
//  DetailedAuctionBuilder.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

class DetailedAuctionBuilder {

    func buildConditionData() -> DismissableData {
        return DismissableData(dismissableType: .condition,
                               tableRowHeight: 100,
                               condition: conditionInformation
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

    func buildOfferData() -> DismissableData {
        return DismissableData(dismissableType: .offer,
                               tableRowHeight: 200,
                               condition: []
        )
    }
}
