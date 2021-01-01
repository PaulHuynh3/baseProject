//
//  Builer.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import Foundation

class ListProductBuilder {

    var delegate: ListProductBuilderDelgate?

    func configure(delegate: ListProductBuilderDelgate) {
        self.delegate = delegate
    }

    func buildDiscardPostAlertData() -> AlertManager.Data {
        let discardData = AlertManager.AlertActionData(title: "Discard",
                                                           style: .destructive,
                                                           isPreferred: false,
                                                           handler: createDiscardPostCallback())

        let cancelData = AlertManager.AlertActionData(title: "Cancel",
                                                      style: .cancel,
                                                      isPreferred: true,
                                                      handler: nil)

        return AlertManager.Data(title: "Discard Listing?",
                                 message: "You're about to discard this listing",
                                 actions: [discardData,cancelData]
        )
    }

    private func createDiscardPostCallback() -> (() -> Void)? {
        return { [weak self] in
            self?.delegate?.discardPost()
        }
    }
}

protocol ListProductBuilderDelgate {
    func discardPost()
}
