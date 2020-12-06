//
//  NetworkError.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-06.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case error(Error)
    case invalidURL
    case noData
}
