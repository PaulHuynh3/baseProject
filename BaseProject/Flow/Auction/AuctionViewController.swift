//
//  AuctionViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-04.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class AuctionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = AuctionViewModel()

    override func viewDidLoad() {
        setup()
    }

    private func setup() {
        viewModel.configure()
        registerNibForTableView(cellType: String(describing: AuctionTableViewCell.self), tableView: tableView)
        registerHeaderFooterTableView(cellType: String(describing: AuctionTableHeaderView.self), tableView: tableView)
    }

    private func navigateToDetailedItem(data: Product) {
         guard let detailedAuctionItemViewController = UIStoryboard(name: String(describing:StoryboardNavigation.DetailedAuctionItemViewController.rawValue), bundle: nil).instantiateViewController(withIdentifier: String(describing: DetailedAuctionItemViewController.self)) as? DetailedAuctionItemViewController else {
             return
         }
         detailedAuctionItemViewController.configure(data: data)
         navigationController?.pushViewController(detailedAuctionItemViewController, animated: true)
     }
}

extension AuctionViewController: TableView {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: AuctionTableHeaderView.self))
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.auctionItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.createAuctionCells(with: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = viewModel.marketProducts[indexPath.row]
        navigateToDetailedItem(data: data)
    }
}
