//
//  NetworkService.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import Foundation

class NetworkService: FetchService {

    func fetch<T: Codable>(method: RequestMethod, url: URL?, success: @escaping ((T) -> Void), failure: @escaping ((NetworkError) -> Void)) {
        guard let url = url else {
            failure(.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.httpMethod


        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let error = err {
                failure(.error(error))
                return
            }

            guard let data = data else {
                failure(.noData)
                return
            }

            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(T.self, from: data)
                success(object)
            } catch {
                failure(.error(error))
            }
        }
        task.resume()
    }
}

protocol FetchService {
    func fetch<T: Codable>(method: RequestMethod, url: URL?, success: @escaping ((T) -> Void), failure: @escaping ((NetworkError) -> Void))
}

enum RequestMethod {
    case get
    case post
    case put
    case delete

    var httpMethod: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}
