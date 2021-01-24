//
//  DismissableType.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

enum DismissableType {
    case offer
    case conditionInformation
    case conditionSelection
    case selectCategory
    case location

    var title: String {
        switch self {
        case .offer:
            return "Your Offer"
        case .conditionInformation:
            return "Condition"
        case .conditionSelection:
            return "Condition"
        case .selectCategory:
            return "Select Category"
        case .location:
            return "Location"
        }
    }
}
