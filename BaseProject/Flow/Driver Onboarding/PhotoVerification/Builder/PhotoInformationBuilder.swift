//
//  PhotoInformationBuilder.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-10-12.
//  Copyright © 2020 Ayno. All rights reserved.
//

import Foundation

class PhotoInformationBuilder {

    func buildDriverLicenseInformationCell(callBack: (() -> Void)?) -> PhotoInformationCell.Data {
        return PhotoInformationCell.Data(
            title: "Driver License",
            description: "Please take a new photo. Make sure the document you're sending is your Driver's License",
            whatIsThisCallback: callBack
        )
    }
}
