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

    var borderWidth: CGFloat {
        1
    }

    var cornerRadius: CGFloat {
        5
    }

    var discardAlertData: AlertManager.Data {
        return builder.buildDiscardPostAlertData()
    }

    var conditionSelectionDismissableData: DismissableData {
        return builder.buildDismissableSelectionData()
    }

    var categorySelectionDismissableData: DismissableData {
        return builder.buildCategorySelectionData()
    }

    func configure(delegate: ListProductViewModelDelegate) {
        self.delegate = delegate
        builder.configure(delegate: self)
    }
}

extension ListProductViewModel: ListProductBuilderDelgate {
    func dismissViewController() {
        delegate?.dismissViewController()
    }

    func popViewController() {
        delegate?.popViewController()
    }
}

protocol ListProductViewModelDelegate {
    func popViewController()
    func dismissViewController()
}
