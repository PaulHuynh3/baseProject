//
//  DriverInfoBuilder.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-10-04.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class DriverInfoBuilder {

    weak var delegate: DriverInfoBuilderDelegate?

    func buildDriverLicenseData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Driver License", isCompleted: isCompleted)
    }

    func buildLegalAgreementData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Legal Agreements", isCompleted: isCompleted)
    }

    func buildWorkEligibilityData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Proof of Work Eligibility", isCompleted: isCompleted)
    }

    func buildProfilePhotoData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Profile Photo", isCompleted: isCompleted)
    }

    func buildVehicleInsuranceData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Vehicle Insurance", isCompleted: isCompleted)
    }

    func buildVehicleRegistrationData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Vehicle Registration", isCompleted: isCompleted)
    }

    func buildVehicleInspectionData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Vehicle Inspection", isCompleted: isCompleted)
    }

    func buildVehicleInformationData(isCompleted: Bool = false) -> DriverRequirementCell.Data {
        return DriverRequirementCell.Data(documentName: "Vehicle Information", isCompleted: isCompleted)
    }

}

protocol DriverInfoBuilderDelegate: class {

}
