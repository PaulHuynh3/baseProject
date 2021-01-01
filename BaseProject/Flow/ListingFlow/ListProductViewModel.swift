//
//  ListProductViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import Foundation

class ListProductViewModel {

    var delegate: ListProductViewModelDelegate?
    private let builder = ListProductBuilder()

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
