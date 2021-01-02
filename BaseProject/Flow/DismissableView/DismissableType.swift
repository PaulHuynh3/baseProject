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

    var title: String {
        switch self {
        case .offer:
            return "Your Offer"
        case .conditionInformation:
            return "Condition"
        case .conditionSelection:
            return "Condition"
        }
    }
}
