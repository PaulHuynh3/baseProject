//
//  DriverLicensePhotoViewController.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-13.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class PhotoInformationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomStatusHelperView: BottomStatusHelperView!
    let viewModel = PhotoInformationViewModel()

    override func viewDidLoad() {
        setup()
        bottomStatusHelperView.configure(data: BottomStatusHelperView.Data(leftButtonCallback: createTakePhotoCallback(), rightButtonCallback: nil, leftButtonText: "Take photo", rightButtonText: nil))
    }

    // MARK: - Setup

    func configure(informationType: InformationType) {
        viewModel.informationType = informationType
    }

    private func setup() {
        viewModel.configure(delegate: self)
        registerNibForTableView(cellType: String(describing: PhotoInformationCell.self), tableView: tableView)
    }

    func setupBottomStatusView() {
        bottomStatusHelperView.configure(data: BottomStatusHelperView.Data(leftButtonCallback: createTakePhotoCallback(), rightButtonCallback: nil, leftButtonText: "Take photo", rightButtonText: nil))
    }

    func createTakePhotoCallback() -> (() -> Void) {
        return {
            guard let cameraViewController = UIStoryboard(name: StoryboardNavigation.DriverInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: CameraViewController.self)) as? CameraViewController else { return }
            self.navigationController?.pushViewController(cameraViewController, animated: true)
            //TODO: - need to request camera usage permission
        }
    }

}

extension PhotoInformationViewController: TableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.showCorrectInformationCell(tableView: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension PhotoInformationViewController: PhotoInformationViewModelDelegate {

}
