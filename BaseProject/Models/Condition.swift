//
//  ProductCondition.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import Foundation

enum Condition {
    case new
    case usedLikeNew
    case usedGood
    case usedFair

    var identifier: String {
        switch self {
        case .new:
            return "Condition: New"
        case .usedLikeNew:
            return "Condition: Used - Like New"
        case .usedGood:
            return "Condition: Used - Good"
        case .usedFair:
            return "Condition: Used - Fair"
        }
    }
}
