//
//  FloatingButton.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class FloatingButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        contentHorizontalAlignment = .center
        backgroundColor = .orange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, image: UIImage?, view: UIView) {
        setTitle(title, for: .normal)
        if let addImage = image {
            setImage(addImage, for: .normal)
        }

        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 120)
            ])
        layer.cornerRadius = 30
        clipsToBounds = true
        layer.masksToBounds = true
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 4

        imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
    }
}

