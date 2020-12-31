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
    let condition: [ConditionInformation?]
    let offer: OfferInformation?
}
