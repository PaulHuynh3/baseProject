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

    lazy var floatingButton: FloatingButton = {
        let button = FloatingButton(frame: .zero)
        button.addTarget(self, action: #selector(floatingButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    @objc func floatingButtonTapped(_ button: UIButton) {
        print("button tapped")
        //open the page and
    }

    private func setup() {
        viewModel.configure()
        setupFloatingView()
        registerNibForTableView(cellType: String(describing: AuctionTableViewCell.self), tableView: tableView)
        registerHeaderFooterTableView(cellType: String(describing: AuctionTableHeaderView.self), tableView: tableView)
    }

    private func setupFloatingView() {
        view.addSubview(floatingButton)
        floatingButton.configure(title: "Post", image: UIImage(named: "add-icon"), view: view)
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
        let data = viewModel.products[indexPath.row]
        navigateToDetailedItem(data: data)
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        viewModel.lastContentOffset = scrollView.contentOffset.y

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if viewModel.lastContentOffset < scrollView.contentOffset.y {
            // did scroll up
            // put post
//            floatingButton.state(title: "", view: view)
        } else if viewModel.lastContentOffset > scrollView.contentOffset.y {
            // did scroll down

//            floatingButton.state(title: "Post", view: view)
            // dont put post
        } else {
            // didn't move
//            floatingButton.state(title: "Post", view: view)
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

    }
}
