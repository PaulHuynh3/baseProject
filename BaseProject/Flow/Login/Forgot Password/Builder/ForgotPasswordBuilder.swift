//
//  ForgotPasswordBuilder.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-21.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class ForgotPasswordBuilder {

    func forgotPasswordViewData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            title: "Email",
            hint: nil,
            mode: .normal,
            leftIconImage: #imageLiteral(resourceName: "user-icon"))
    }

    func buildInvalidEmailData() -> AlertManager.Data {
        return AlertManager.Data(
            title: "Invalid Email",
            message: "Please enter a valid email",
            actions: nil
        )
    }
}
