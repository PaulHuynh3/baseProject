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

//    func state(title: String?, view: UIView) {
////        frame.size = CGSize(width: 60, height: 60)
//        setTitleLessState(title: title, view: view)
//    }
//
//    private func setTitleLessState(title: String?, view: UIView) {
//        setTitle(title ?? "", for: .normal)
//        if title == "" {
//            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70).isActive = true
//            widthAnchor.constraint(equalToConstant: 60).isActive = true
//            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            frame.origin = CGPoint(x: frameOrigin!.x + 60, y: frameOrigin!.y)
//        } else {
//            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
//
//            widthAnchor.constraint(equalToConstant: 120).isActive = true
//            imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
//        }
//        heightAnchor.constraint(equalToConstant: 60).isActive = true
//        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
//    }
}

