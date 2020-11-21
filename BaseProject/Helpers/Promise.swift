//
//  Promise.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-06.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

class Promise<Value> {
    typealias Result = Swift.Result<Value, Error>

    init(_ value: Value? = nil) {

        // Report directly if the value was set at the time the promise was constructed
        result = value.map(Result.success)
    }

    private var callbacks = [(Result) -> Void]()

    var result: Result? {
        didSet {
            result.map(report)
        }
    }

    func resolve(with value: Value) {
        result = .success(value)
    }

    func reject(with error: Error) {
        result = .failure(error)
    }

    func observe(with callback: @escaping (Result) -> Void) {
        // if result was already been set call the callback directly

        if let result = result {
            return callback(result)
        }
        callbacks.append(callback)
    }

    private func report(result: Result) {
        callbacks.forEach { $0(result) }
        callbacks = []
    }
}

extension Promise {
    
    @discardableResult
    func then(_ completion: @escaping (Value) -> Void) -> Promise {
        observe { result in
            switch result {
            case let .success(value):
                completion(value)
            case .failure:
                break
            }
        }
        return self
    }

    @discardableResult
    func thenMapValue<T>(_ mapping: @escaping (Value) -> T) -> Promise<T> {
        let promise = Promise<T>()
        observe { result in
            switch result {
            case let .success(value):
                promise.resolve(with: mapping(value))
            case let .failure(error):
                promise.reject(with: error)
            }
        }
        return promise
    }

    @discardableResult
    func thenAppendPromise<T>(_ callback: @escaping () -> Promise<T>) -> Promise<T> {
        let promise = Promise<T>()
        observe { result in
            switch result {
            case .success:
                callback().observe { tResult in
                    switch tResult {
                    case let .success(tValue):
                        promise.resolve(with: tValue)
                    case let .failure(error):
                        promise.reject(with: error)
                    }
                }
            case let .failure(error):
                promise.reject(with: error)
            }
        }
        return promise
    }

    @discardableResult
    func thenAppendPromiseWithValue<T>(_ callback: @escaping (Value) -> Promise<T>) -> Promise<T> {
        let promise = Promise<T>()
        observe { result in
            switch result {
            case let .success(value):
                callback(value).observe { tResult in
                    switch tResult {
                    case let .success(tValue):
                        promise.resolve(with: tValue)
                    case let .failure(error):
                        promise.reject(with: error)
                    }
                }
            case let .failure(error):
                promise.reject(with: error)
            }
        }
        return promise
    }

    @discardableResult
    func `do`(_ callback: @escaping () -> Void) -> Promise {
        observe { result in
            switch result {
            case .success:
                callback()
            case .failure:
                break
            }
        }
        return self
    }

    @discardableResult
    func `catch`(_ completion: @escaping (Error) -> Void) -> Promise {
        observe { result in
            switch result {
            case .success:
                return
            case let .failure(error):
                completion(error)
            }
        }
        return self
    }

    @discardableResult
    func `catch`(_ completion: @escaping () -> Void) -> Promise {
        observe { result in
            switch result {
            case .success:
                return
            case .failure:
                completion()
            }
        }
        return self
    }

}
