//
//  PhotoInformationViewModel.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-09.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class PhotoInformationViewModel {

    var delegate: PhotoInformationViewModelDelegate?
    var informationType: InformationType?
    let builder = PhotoInformationBuilder()

    func configure(delegate: PhotoInformationViewModelDelegate) {

    }

    func showCorrectInformationCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let informationType = informationType else {
            fatalError("InformationType in PhotoInformationviewmodel is nil")
        }
        let cell = tableView.dequeue(cell: PhotoInformationCell.self, in: tableView, for: indexPath)
        switch informationType {
        case .driverLicense:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .legalAgreements:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .workEligibility:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .profilePhoto:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .vehicleInsurance:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .vehicleRegistration:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .vehicleInspection:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        case .vehicleInformation:
            cell.configure(data: builder.buildDriverLicenseInformationCell(callBack: createDriverLicenseWhatIsThisCallback()))
        }

        return cell
    }

    func createDriverLicenseWhatIsThisCallback() -> (() -> Void)? {
        return {
            print("direct them to the website explaining")
        }
    }

}

protocol PhotoInformationViewModelDelegate: class {

}
