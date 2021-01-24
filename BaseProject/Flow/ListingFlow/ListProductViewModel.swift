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
    
    var listType: ListingType = .market

    var dismissableController: DismissableViewController? {
        let dismissableController = UIStoryboard(name: String(describing: DismissableViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DismissableViewController.self)) as? DismissableViewController
        return dismissableController
    }

    var borderColour: CGColor {
        UIColor.lightGray.cgColor
    }

    var condition: Condition? {
        return builder.condition
    }

    var category: Category? {
        return builder.category
    }

    var location: String? {
        return builder.location
    }

    var borderWidth: CGFloat {
        1
    }

    var cornerRadius: CGFloat {
        5
    }

    var discardAlertData: AlertManager.Data {
        return builder.buildDiscardPostAlertData()
    }

    var conditionDismissableData: DismissableData {
        return builder.buildConditionDismissableData()
    }

    var categoryDismissableData: DismissableData {
        return builder.buildCategoryDismissableData()
    }

    var locationDismissableData: DismissableData {
        return builder.buildLocationDismissableData()
    }

    func missingFieldsAlertData() -> AlertManager.Data {
        return AlertManager.Data(title: "Required", message: "Please fill out all the information", actions: nil)
    }

    func configure(delegate: ListProductViewModelDelegate) {
        self.delegate = delegate
        builder.configure(delegate: self)
    }
}

extension ListProductViewModel: ListProductBuilderDelgate {
    func update(condition: Condition) {
        delegate?.update(condition: condition)
    }

    func update(category: Category) {
        delegate?.update(category: category)
    }

    func dismissViewController() {
        delegate?.dismissViewController()
    }

    func popViewController() {
        delegate?.popViewController()
    }

    func update(location: String) {
        delegate?.update(location: location)
    }
}

protocol ListProductViewModelDelegate {
    func update(category: Category)
    func update(condition: Condition)
    func update(location: String)
    func popViewController()
    func dismissViewController()
}
