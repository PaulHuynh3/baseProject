//
//  DriverLoginViewModel.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class LoginViewModel {

    var delegate: LoginViewModelDelegate?
    let builder = LoginBuilder()

    func configure(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }

    func emailTextViewData() -> GeneralTextView.Data {
        return builder.buildEmailData()
    }

    func passwordTextViewData() -> GeneralTextView.Data {
        return builder.buildPasswordData()
    }

    func emailValidation(_ email: UITextField) -> String? {
        guard let email = email.text else {
            return "The email entered is not valid"
        }
        return email.isValidEmail() ? nil : "The email entered is not valid"
    }

    func passwordValidation(_ password: UITextField) -> String? {
        guard let password = password.text else {
            return "The email entered is not valid"
        }
        return password.isValidPassword() ? nil : "Please enter a valid password"
    }

    func isEmailValid(_ email: UITextField) -> Bool {
        guard let email = email.text else {
            return false
        }
        return email.isValidEmail()
    }

    func isPasswordValid(_ password: UITextField) -> Bool {
        guard let password = password.text else {
            return false
        }
        return password.isValidPassword()
    }

    func showCredentialError() {
        delegate?.showAlert(data: builder.buildCredentialError())
    }
}

protocol LoginViewModelDelegate {
    func showAlert(data: AlertManager.Data)
}

extension LoginViewModel: GeneralTextViewDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("aa")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
         print("aa")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
         print("aa")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         print("aa")
        return true
    }
}
