//
//  BurgerMenuTableViewController.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-18.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class BurgerMenuViewController: UIViewController {
    //MARK - Properties

    let viewModel = BurgerMenuViewModel()
    static var animationDuration: TimeInterval = 0.4
    static var widthRatio: CGFloat = 0.60
    var interactor = BurgerMenuModalInteractor()
    weak var delegate: BurgerMenuDelegate?

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    //MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.configure(delegate: self)
    }

    func setup() {
        registerNibForTableView(cellType: String(describing: BurgerMenuCell.self), tableView: tableView)
        tableView.backgroundColor = .black
    }
}

extension BurgerMenuViewController: TableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.createMenuCells(with: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.createMenuCellCallback(with: tableView, indexPath: indexPath)
    }
}

extension BurgerMenuViewController: BurgerMenuViewModelDelegate {
    func openCampaign() {
//        guard let passiveLoadingViewController = UIStoryboard(name: StoryboardNavigation.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier:  String(describing: PassiveLoadingViewController.self)) as? PassiveLoadingViewController else { return }
//        let navigationController = UINavigationController(rootViewController: passiveLoadingViewController)
//        present(navigationController, animated: true, completion: nil)
    }

    func openDriveWithPaul Huynh() {
        guard let driverInfoViewController = UIStoryboard(name: StoryboardNavigation.DriverInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: DriverInfoViewController.self)) as? DriverInfoViewController else { return }
        driverInfoViewController.configure(callback: createDismissCallback())

        let navigationController = UINavigationController(rootViewController: driverInfoViewController)

        present(navigationController, animated: true, completion: nil)
    }

    func openHelp() {

    }

    private func createDismissCallback() -> () -> Void {
        return {
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension BurgerMenuViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BurgerMenuPresentationController(presentedViewController: presented, presenting: presenting)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let burgerMenuAnimatedTransitioning = BurgerMenuAnimatedTransitioning()
        burgerMenuAnimatedTransitioning.interactor = interactor
        burgerMenuAnimatedTransitioning.isPresenting = false
        return burgerMenuAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BurgerMenuAnimatedTransitioning()
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

protocol BurgerMenuDelegate: class {

}
