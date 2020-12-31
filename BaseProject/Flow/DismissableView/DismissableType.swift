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
    case condition

    var title: String {
        switch self {
        case .offer:
            return "Your Offer"
        case .condition:
            return "Condition"
        }
    }
}
