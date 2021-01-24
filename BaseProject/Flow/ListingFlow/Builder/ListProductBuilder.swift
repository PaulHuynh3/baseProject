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
    var condition: Condition?
    var category: Category?

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

    func buildConditionDismissableData() -> DismissableData {
        return DismissableData(dismissableType: .conditionSelection, tableRowHeight: 200, conditionSelection: buildConditionSelectionData()
        )
    }

    func buildCategoryDismissableData() -> DismissableData {
        return DismissableData(dismissableType: .selectCategory, tableRowHeight: 50, categorySelection: categorySelectionData())
    }

    func buildLocationDismissableData() -> DismissableData {
        return DismissableData(dismissableType: .location, tableRowHeight: 0, location: LocationTableViewCell.Data(userLocalityCallback: createLocationLocalityCallback()))
    }

    private func createLocationLocalityCallback() -> ((String) -> Void?) {
        return { [weak self] postalCode in
            self?.delegate?.dismissViewController()
            return self?.delegate?.update(location: postalCode)
        }
    }

    private func categorySelectionData() -> CategorySelection {
        let categoryType: [CategoryType] = [.clothingAccessories, .electronics, .entertainmentHobbies, .healthBeauty, .homeGarden, .miscellaneous]
        return CategorySelection(categoryTypes: categoryType, categorySelectedCallback: categorySelectedCallback())
    }

    private func categorySelectedCallback() -> ((Category) -> Void)? {
        return { [weak self] category in
            self?.category = category
            self?.delegate?.dismissViewController()
            self?.delegate?.update(category: category)
        }
    }

    private func buildConditionSelectionData() -> ConditionTableViewCell.Data {
        return ConditionTableViewCell.Data(condition: condition,
                                           selectedConditionCallback: createConditionSelectionCallback())
    }

    private func createConditionSelectionCallback() -> ((Condition) -> Void)? {
        return { [weak self] condition in
            self?.condition = condition
            self?.delegate?.dismissViewController()
            self?.delegate?.update(condition: condition)
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
    func update(condition: Condition)
    func update(category: Category)
    func update(location: String)
}

struct CategorySelection {
    var categoryTypes: [CategoryType]
    var categorySelectedCallback: ((Category) -> Void)?
}
