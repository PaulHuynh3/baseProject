//
//  DismissableConditionViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-30.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DismissableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    var delegate: DismissableViewControllerDelegate?
    let viewModel = DismissableViewModel()

    override func viewDidLoad() {
        setup()
        viewModel.configure(delegate: self)
    }

    func configure(delegate: DismissableViewControllerDelegate, data: DismissableData) {
        self.delegate = delegate
        viewModel.data = data
    }

    private func setup() {
        guard let type = viewModel.data?.dismissableType else { return }
        switch type {
        case .offer:
            registerNibForTableView(cellType: String(describing: OfferViewCell.self), tableView: tableView)
            tableViewHeightConstraint.constant = CGFloat(viewModel.rowHeight + viewModel.headerHeight)
        case .condition:
            registerNibForTableView(cellType: String(describing: ConditionViewCell.self), tableView: tableView)
            tableViewHeightConstraint.constant = CGFloat(viewModel.rowHeight * (viewModel.data?.condition.count ?? 0) + viewModel.headerHeight)
        }

        registerHeaderFooterTableView(cellType: String(describing: DismissableHeaderView.self), tableView: tableView)
    }

    @IBAction func dismissTapped(_ sender: Any) {
        delegate?.dismissSheet()
    }
}

struct DismissableData {
    let dismissableType: DismissableType
    let tableRowHeight: Int
    let condition: [ConditionInformation?]
    let offer: OfferInformation?
}

extension DismissableViewController: TableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.createNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.createTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.setHeightForRow()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(viewModel.headerHeight)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: DismissableHeaderView.self)) as? DismissableHeaderView else { fatalError("Condition Collection header messed up") }
        let title = viewModel.data?.dismissableType.title ?? ""
        headerView.configure(data: viewModel.buildHeaderViewData(title: title))
        return headerView
    }
}

extension DismissableViewController: DismissableViewModelDelegate {
    func dismiss() {
        delegate?.dismissSheet()
    }
}

enum DismissableType {
    case offer
    case condition

    var title: String {
        switch self {
        case .offer:
            return "Your Offer"
        case .condition:
            return "Condition"
        }
    }
}

protocol DismissableViewControllerDelegate {
    func dismissSheet()
}
