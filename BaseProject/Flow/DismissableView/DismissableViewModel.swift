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
        case .conditionInformation:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConditionViewCell.self)) as? ConditionViewCell else { fatalError("Dismissable Crashed") }
            guard let conditionData = data?.conditionInfo[indexPath.row] else { fatalError("condition data missing") }
            let data = ConditionViewCell.Data(title: conditionData.subTitle, description: conditionData.description)
            cell.configure(data: data)
            return cell
        case .offer:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OfferViewCell.self)) as? OfferViewCell else { fatalError("Dismissable Crashed") }
            cell.configure(data: data?.offer, dismissCallback: createExitCallback())
            return cell
        case .conditionSelection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConditionTableViewCell.self)) as? ConditionTableViewCell else { fatalError("Dismissable Crashed") }
            guard let data = data?.conditionSelection else { fatalError()}
            cell.configure(data: data)
            return cell
        }
    }

    func createNumberOfRows() -> Int {
        guard let type = data?.dismissableType else { fatalError("Dismissal number of rows") }
        switch type {
        case .conditionInformation:
            return data?.conditionInfo.count ?? 0
        default:
            return 1
        }
    }

    func setHeightForRow() -> CGFloat {
        return CGFloat(rowHeight)
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
