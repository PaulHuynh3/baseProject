//
//  LoginBuilder.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-13.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

class LoginBuilder {

    func buildEmailData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            nameLabel: "Email",
            hintLabel: nil,
            mode: .normal)
    }

    func buildPasswordData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            nameLabel: "Password",
            hintLabel: nil,
            mode: .password)
    }

    func buildCredentialError() -> AlertManager.Data {
        return AlertManager.Data(
            title: "Credentials Error",
            message: "Credentials entered is invalid",
            actions: nil)
    }

}
