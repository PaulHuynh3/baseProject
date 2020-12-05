//
//  Bindable.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class Bindable<ObservedType> {
    private var callbacks = [(ObservedType) -> Bool]()

    public var value: ObservedType? {
        didSet {
            if let value = value {
                report(value)
            }
        }
    }

    public init(_ value: ObservedType? = nil) {
        self.value = value
        callbacks = []
    }


    func bind(_ object: AnyObject, callback: @escaping (ObservedType) -> Void) {
        callbacks.append { [weak object] value in
            guard object != nil else { return false }

            callback(value)
            return true
        }
    }

    private func report(_ value: ObservedType) {
        callbacks = callbacks.filter {
            $0(value)
        }
    }

}
