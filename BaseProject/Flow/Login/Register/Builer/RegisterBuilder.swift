//
//  RegisterBuilder.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-30.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class RegisterBuilder {

    func buildEmailData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            nameLabel: "Email",
            hintLabel: nil,
            mode: .normal)
    }

    func buildPasswordData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .default,
            nameLabel: "Password",
            hintLabel: "At least 8 characters with a number and a special character",
            mode: .password,
            rightIconImage: #imageLiteral(resourceName: "show-password-icon"),
            rightButtonType: .password)
    }

    func buildConfirmPasswordData() -> GeneralTextView.Data {
        return GeneralTextView.Data(
            keyboardType: .emailAddress,
            nameLabel: "Confirm Password",
            hintLabel: nil,
            mode: .password,
            rightIconImage: #imageLiteral(resourceName: "show-password-icon"),
            rightButtonType: .password)
    }
    
}
