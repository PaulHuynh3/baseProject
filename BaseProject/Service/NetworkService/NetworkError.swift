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

enum HTTPError: String, Error {
    case unknown        = "Unknown"
    case success        = "Success"
    case created        = "Created"
    case accepted       = "Accepted"
    case redirection    = "Redirection"
    case clientError    = "Client Error"
    case badRequest     = "Bad Request"
    case unauthorized   = "unauthorized"
    case payRequired    = "Payment Required"
    case forbidden      = "Forbidden"
    case notFound       = "Not Found"
    case notAllowed     = "Method Not Allowed"
    case notAcceptable  = "Not Acceptable"
    case requestTimeout = "Request Timeout"
    case serverError    = "Server Error"
    case internlError   = "Internal Server Error"
    case notImplemented = "Not Implemented"
    case badGateway     = "Bad Gateway"
    case unavailable    = "Service Unavailable"
    case gatewayTimeout = "Gateway Timeout"
    case emptyData      = "Empty Data"
    case decodeError    = "Decoding Failed"
}
