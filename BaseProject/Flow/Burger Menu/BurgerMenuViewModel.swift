//
//  BurgerMenuViewModel.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-19.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class BurgerMenuViewModel {

    var delegate: BurgerMenuViewModelDelegate?
    var builder = BurgerMenuBuilder()
    var menuItems: Int {
        return MenuItem.allCases.count
    }

    func configure(delegate: BurgerMenuViewModelDelegate) {
        self.delegate = delegate
    }

    func createMenuCells(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BurgerMenuCell.self, in: tableView, for: indexPath)
        switch MenuItem(indexPath: indexPath) {
        case .campaign:
            cell.configure(data: builder.buildCampaignData())
            return cell
        case .driveWithUs:
            cell.configure(data: builder.buildDriveData())
            return cell
        case .help:
            cell.configure(data: builder.buildHelpData())
            return cell
        }
    }

    var refreshBindable: Bindable<Bool> = Bindable<Bool>(false)
    func createMenuCellCallback(with tableView: UITableView, indexPath: IndexPath) {
        switch MenuItem(indexPath: indexPath) {
        case .campaign:
            delegate?.openCampaign()
        case .driveWithUs:
            delegate?.openDrive()
        case .help:
            delegate?.openHelp()
        }
    }

}

protocol BurgerMenuViewModelDelegate {
    func openCampaign()
    func openDrive()
    func openHelp()
}

enum MenuItem: CaseIterable {
    case campaign
    case driveWithUs
    case help

    init(indexPath: IndexPath) {
        switch indexPath.row {
        case 0: self = .campaign
        case 1: self = .driveWithUs
        case 2: self = .help
        default: fatalError("BurgerMenu indexpath selected is not valid")
        }
    }
}
