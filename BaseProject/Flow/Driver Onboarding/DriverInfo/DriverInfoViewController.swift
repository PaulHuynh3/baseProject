//
//  DriverInfoViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-20.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class DriverInfoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    let viewModel = DriverInfoViewModel()
    private var dismissCallback: (() -> Void)?

    override func viewDidLoad() {
        setup()
    }

    // MARK: - Setup

    private func setup() {
        viewModel.configure(delegate: self)
        registerNibForTableView(cellType: String(describing: DriverRequirementCell.self), tableView: tableView)
    }

    func configure(callback: @escaping (() -> Void)) {
        dismissCallback = callback
    }

    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true, completion: {
            self.dismissCallback?()
        })
    }
}

extension DriverInfoViewController: TableView {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.createMenuCells(with: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.createMenuSelectedCellCallback(with: tableView, indexPath: indexPath)
    }
}

extension DriverInfoViewController: DriverInfoViewModelDelegate {
    func openDriverLicense() {
        viewModel.openDriverLicense(naviagtionController: navigationController)
    }

    func openLegalAgreements() {

    }

    func openWorkEligibility() {

    }

    func openProfilePhoto() {

    }

    func openVehicleInsurance() {

    }

    func openVehicleRegistration() {

    }

    func openVehicleInspection() {

    }

    func openVehicleInformation() {

    }
}
