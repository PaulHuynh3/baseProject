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
        setupCell()
        setupHeader()
        viewModel.configure(delegate: self)
    }

    func configure(delegate: DismissableViewControllerDelegate, data: DismissableData) {
        self.delegate = delegate
        viewModel.data = data
    }

    private func setupCell() {
        switch viewModel.dismissableType {
        case .offer:
            registerNibForTableView(cellType: String(describing: OfferViewCell.self), tableView: tableView)
            tableViewHeightConstraint.constant = CGFloat(viewModel.rowHeight + viewModel.headerHeight)
        case .conditionInformation:
            registerNibForTableView(cellType: String(describing: ConditionViewCell.self), tableView: tableView)
            tableViewHeightConstraint.constant = CGFloat(viewModel.rowHeight * (viewModel.data?.conditionInfo.count ?? 0) + viewModel.headerHeight)
        case .conditionSelection:
            registerNibForTableView(cellType: String(describing: ConditionTableViewCell.self), tableView: tableView)
            tableViewHeightConstraint.constant = CGFloat(viewModel.rowHeight + viewModel.headerHeight)
        case .selectCategory:
            registerNibForTableView(cellType: String(describing: CategoryTableViewCell.self), tableView: tableView)
            tableViewHeightConstraint.constant = CGFloat(view.frame.height/1.5)
        }
    }

    private func setupHeader() {
        switch viewModel.dismissableType {
        case .selectCategory:
            registerHeaderFooterTableView(cellType: String(describing: CategoryHeaderView.self), tableView: tableView)
        default:
            registerHeaderFooterTableView(cellType: String(describing: DismissableHeaderView.self), tableView: tableView)
        }
    }

    @IBAction func dismissTapped(_ sender: Any) {
        delegate?.dismissSheet()
    }
}

extension DismissableViewController: TableView {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.createHeaderSectionView(tableView: tableView, section: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(viewModel.headerHeight)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.setHeightForRow()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.createTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.didSelectRowAtIndexPath(indexPath: indexPath)
    }
}

extension DismissableViewController: DismissableViewModelDelegate {
    func dismiss() {
        delegate?.dismissSheet()
    }
}

protocol DismissableViewControllerDelegate {
    func dismissSheet()
}
