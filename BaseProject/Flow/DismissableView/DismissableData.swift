//
//  DismissableData.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

struct DismissableData {
    let dismissableType: DismissableType
    let tableRowHeight: Int
    let conditionInfo: [ConditionInformation?]
    let offer: OfferViewCell.Data?
    let conditionSelection: ConditionTableViewCell.Data?
    let categorySelection: CategorySelection?
    let location: LocationTableViewCell.Data?

    init(dismissableType: DismissableType, tableRowHeight: Int, conditionInfo: [ConditionInformation?] = [], offer: OfferViewCell.Data? = nil, conditionSelection: ConditionTableViewCell.Data? = nil, categorySelection: CategorySelection? = nil, location: LocationTableViewCell.Data? = nil) {
        self.dismissableType = dismissableType
        self.tableRowHeight = tableRowHeight
        self.conditionInfo = conditionInfo
        self.offer = offer
        self.conditionSelection = conditionSelection
        self.categorySelection = categorySelection
        self.location = location
    }
}
