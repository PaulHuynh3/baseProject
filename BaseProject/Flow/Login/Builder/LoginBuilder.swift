//
//  LoginBuilder.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-13.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class LoginBuilder {

    func buildEmailData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            title: "Email",
            hint: nil,
            mode: .normal,
            leftIconImage: #imageLiteral(resourceName: "user-icon"))
    }

    func buildPasswordData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            title: "Password",
            hint: nil,
            mode: .password,
            leftIconImage: #imageLiteral(resourceName: "lock-icon"),
            rightIconImage: #imageLiteral(resourceName: "show-password-icon"))
    }

    func buildCredentialError() -> AlertManager.Data {
        return AlertManager.Data(
            title: "Credentials Error",
            message: "Credentials entered is invalid",
            actions: nil)
    }
}
