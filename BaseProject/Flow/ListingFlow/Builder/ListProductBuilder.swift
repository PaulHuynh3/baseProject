//
//  Builer.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class ListProductBuilder {

    var delegate: ListProductBuilderDelgate?
    private var condition: Condition?

    func configure(delegate: ListProductBuilderDelgate) {
        self.delegate = delegate
    }

    func buildDiscardPostAlertData() -> AlertManager.Data {
        let discardData = AlertManager
                            .AlertActionData(title: "Discard",
                                             style: .destructive,
                                             isPreferred: false,
                                             handler: createDiscardPostCallback())

        let cancelData = AlertManager
                            .AlertActionData(title: "Cancel",
                                             style: .cancel,
                                             isPreferred: true,
                                             handler: nil)

        return AlertManager.Data(title: "Discard Listing?",
                                 message: "You're about to discard this listing",
                                 actions: [discardData,cancelData]
        )
    }

    func buildDismissableSelectionData() -> DismissableData {
        return DismissableData(dismissableType: .conditionSelection, tableRowHeight: 200, conditionInfo: [], offer: nil, conditionSelection: buildConditionSelectionData()
        )
    }

    private func buildConditionSelectionData() -> ConditionTableViewCell.Data {
        return ConditionTableViewCell.Data(condition: condition,
                                           selectedConditionCallback: createConditionSelectionCallback())
    }

    private func createConditionSelectionCallback() -> ((Condition) -> Void)? {
        return { [weak self] condition in
            self?.condition = condition
            self?.delegate?.dismissViewController()
        }
    }

    private func createDiscardPostCallback() -> (() -> Void)? {
        return { [weak self] in
            self?.delegate?.popViewController()
        }
    }
}

protocol ListProductBuilderDelgate {
    func popViewController()
    func dismissViewController()
}
