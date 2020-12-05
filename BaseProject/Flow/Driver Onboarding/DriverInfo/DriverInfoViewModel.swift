//
//  DriverInfoViewModel.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-04.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import Foundation

import UIKit

class DriverInfoViewModel {

    var delegate: DriverInfoViewModelDelegate?
    let builder = DriverInfoBuilder()
    var menuItems: Int {
        return InformationType.allCases.count
    }

    func configure(delegate: DriverInfoViewModelDelegate) {
        self.delegate = delegate
    }

    func createMenuCells(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeue(cell: DriverRequirementCell.self, in: tableView, for: indexPath)

        switch InformationType(indexPath: indexPath) {
        case .driverLicense:
            cell.configure(data: builder.buildDriverLicenseData())
            return cell
        case .legalAgreements:
            cell.configure(data: builder.buildLegalAgreementData())
            return cell
        case .workEligibility:
            cell.configure(data: builder.buildWorkEligibilityData())
            return cell
        case .profilePhoto:
            cell.configure(data: builder.buildProfilePhotoData())
            return cell
        case .vehicleInsurance:
            cell.configure(data: builder.buildVehicleInsuranceData())
            return cell
        case .vehicleRegistration:
            cell.configure(data: builder.buildVehicleRegistrationData())
            return cell
        case .vehicleInspection:
            cell.configure(data: builder.buildVehicleInspectionData())
            return cell
        case .vehicleInformation:
            cell.configure(data: builder.buildVehicleInformationData())
            return cell
        }
    }

    func createMenuSelectedCellCallback(with tableView: UITableView, indexPath: IndexPath) {
        switch InformationType(indexPath: indexPath) {
        case .driverLicense:
            delegate?.openDriverLicense()
        case .legalAgreements:
            delegate?.openLegalAgreements()
        case .workEligibility:
            delegate?.openWorkEligibility()
        case .profilePhoto:
            delegate?.openProfilePhoto()
        case .vehicleInsurance:
            delegate?.openVehicleInsurance()
        case .vehicleRegistration:
            delegate?.openVehicleRegistration()
        case .vehicleInspection:
            delegate?.openVehicleInspection()
        case .vehicleInformation:
            delegate?.openVehicleInformation()
        }
    }

    func openDriverLicense(naviagtionController: UINavigationController?) {
        guard let photoInformationViewController = UIStoryboard(name: String(describing:StoryboardNavigation.DriverInfo), bundle: nil).instantiateViewController(withIdentifier: String(describing: PhotoInformationViewController.self)) as? PhotoInformationViewController else {
            fatalError("PhotoinformationViewController failed to instantiate")
        }
        photoInformationViewController.configure(informationType: .driverLicense)
        naviagtionController?.pushViewController(photoInformationViewController, animated: true)
    }

}

protocol DriverInfoViewModelDelegate {
    func openDriverLicense()
    func openLegalAgreements()
    func openWorkEligibility()
    func openProfilePhoto()
    func openVehicleInsurance()
    func openVehicleRegistration()
    func openVehicleInspection()
    func openVehicleInformation()
}

enum InformationType: CaseIterable {
    case driverLicense
    case legalAgreements
    case workEligibility
    case profilePhoto
    case vehicleInsurance
    case vehicleRegistration
    case vehicleInspection
    case vehicleInformation

    init(indexPath: IndexPath) {
        switch indexPath.row {
        case 0: self = .driverLicense
        case 1: self = .legalAgreements
        case 2: self = .workEligibility
        case 3: self = .profilePhoto
        case 4: self = .vehicleInsurance
        case 5: self = .vehicleRegistration
        case 6: self = .vehicleInspection
        case 7: self = .vehicleInformation
        default: fatalError("DriverInfoMenu indexpath selected is not valid")
        }
    }
}

