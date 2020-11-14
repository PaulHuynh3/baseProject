//
//  NibOwnerLoadable.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-12.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

protocol NibOwnerLoadable {
    static var nib: UINib { get }
}

extension NibOwnerLoadable where Self: UIView {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    func instantiateFromNib() -> UIView? {
        let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }

    func loadNibContent() {
        guard let view = instantiateFromNib() else {
            fatalError("Error instantiating nib: \(Self.nib)")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let views = ["view": view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: views)
        addConstraints(verticalConstraints + horizontalConstraints)
    }
}
