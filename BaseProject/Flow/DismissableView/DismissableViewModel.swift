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
    var dismissableType: DismissableType {
        guard let cellType = data?.dismissableType else { fatalError() }
        return cellType
    }

    func configure(delegate: DismissableViewModelDelegate?) {
        self.delegate = delegate
    }

    func createHeaderSectionView(tableView: UITableView, section: Int) -> UIView? {
        switch dismissableType {
        case .selectCategory:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: CategoryHeaderView.self)) as? CategoryHeaderView else { fatalError() }
            let title = data?.categorySelection?.categoryTypes[section].title
            headerView.configure(title: title ?? "")
            return headerView
        default:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: DismissableHeaderView.self)) as? DismissableHeaderView else { fatalError("Condition Collection header messed up") }
            let title = data?.dismissableType.title ?? ""
            headerView.configure(data: buildHeaderViewData(title: title))
            return headerView
        }
    }

    func setHeightForRow() -> CGFloat {
        return CGFloat(rowHeight)
    }

    func numberOfSection() -> Int {
        switch dismissableType {
        case .selectCategory:
            return data?.categorySelection?.categoryTypes.count ?? 1
        default:
            return 1
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        switch dismissableType {
        case .conditionInformation:
            return data?.conditionInfo.count ?? 0
        case .selectCategory:
            return data?.categorySelection?.categoryTypes[section].category.count ?? 0
        default:
            return 1
        }
    }

    func createTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch dismissableType {
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
        case .selectCategory:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableViewCell.self)) as? CategoryTableViewCell else { fatalError("Dismissable Crashed") }
            let title = data?.categorySelection?.categoryTypes[indexPath.section].category[indexPath.row].title
            cell.configure(title: title ?? "")
            return cell
        }
    }

    func didSelectRowAtIndexPath(indexPath: IndexPath) {
        switch dismissableType {
        case .selectCategory:
            guard let category = data?.categorySelection?.categoryTypes[indexPath.section].category[indexPath.row] else { return }
            data?.categorySelection?.categorySelectedCallback?(category)
        default:
            print("Do nothing")
        }
    }

    private func buildHeaderViewData(title: String) -> DismissableHeaderView.Data {
        return DismissableHeaderView.Data(title: title,
                                        exitButtonCallback: createExitCallback())
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
