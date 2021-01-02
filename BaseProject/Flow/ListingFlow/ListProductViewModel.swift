//
//  ListProductViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class ListProductViewModel {

    var delegate: ListProductViewModelDelegate?
    private let builder = ListProductBuilder()

    var borderColour: CGColor {
        UIColor.lightGray.cgColor
    }

    var borderWidth: CGFloat {
        1
    }

    var cornerRadius: CGFloat {
        5
    }


    func configure(delegate: ListProductViewModelDelegate) {
        self.delegate = delegate
        builder.configure(delegate: self)
    }

    var discardAlertData: AlertManager.Data {
        return builder.buildDiscardPostAlertData()
    }
}

extension ListProductViewModel: ListProductBuilderDelgate {
    func discardPost() {
        delegate?.discardPost()
    }
}

protocol ListProductViewModelDelegate {
    func discardPost()
}
