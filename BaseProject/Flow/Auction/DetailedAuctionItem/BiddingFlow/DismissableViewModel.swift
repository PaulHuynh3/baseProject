//
//  DismissableViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DismissableViewModel {

    var delegate: DismissableViewModelDelegate?
    var data: DismissableData?
    var headerHeight: Int {
        return 50
    }
    var rowHeight: Int {
        data?.tableRowHeight ?? 0
    }

    func configure(delegate: DismissableViewModelDelegate?) {
        self.delegate = delegate
    }

    func buildHeaderViewData(title: String) -> DismissableHeaderView.Data {
        return DismissableHeaderView.Data(title: title,
                                        exitButtonCallback: createExitCallback())
    }

    func createTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = data?.dismissableType else { fatalError("Cell not set up properly DimissableVM") }

        switch cellType {
        case .condition:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConditionViewCell.self)) as? ConditionViewCell else { fatalError("DismissableCondition Crashed") }
            guard let conditionData = data?.condition[indexPath.row] else { fatalError("condition data missing") }
            let data = ConditionViewCell.Data(title: conditionData.subTitle, description: conditionData.description)
            cell.configure(data: data)
            return cell
        case .offer:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OfferViewCell.self)) as? OfferViewCell else { fatalError("DismissableCondition Crashed") }
            return cell
        }
    }

    func createNumberOfRows() -> Int {
        guard let type = data?.dismissableType else { fatalError("Dismissal number of rows") }
        switch type {
        case .offer:
            return 1
        case .condition:
            return data?.condition.count ?? 0
        }
    }

    func setHeightForRow() -> CGFloat {
        guard let type = data?.dismissableType else { fatalError("Dismissal number of rows") }
        switch type {
        case .offer:
            return CGFloat(rowHeight)
        case .condition:
            return CGFloat(rowHeight)
        }
    }

    private func createExitCallback() -> (() -> Void)? {
        return { [weak self] in
            self?.delegate?.dismiss()
        }
    }
}

protocol DismissableViewModelDelegate {
    func dismiss()
}
