//
//  RegisterViewModel.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-30.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class RegisterViewModel {

    // MARK: - Properties
    weak var delegate: RegisterViewModelDelegate?

    // MARK: - Configuration

    func configure(delegate: RegisterViewModelDelegate) {
        self.delegate = delegate
    }

    func isValidNameTextfield(_ textfield: UITextField) -> Bool {
        return textfield.text?.trim().count ?? 0 > 0
    }

    func isValidEmailTextfield(_ text: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

        return emailTest.evaluate(with: text)
    }

    func isValidPassword(_ text: String?) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let checkForCapital = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalResult = checkForCapital.evaluate(with: text)

        let lowerLetterRegEx = ".*[a-z]+.*"
        let checkForLowerCase = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
        let lowerCaseResult = checkForLowerCase.evaluate(with: text)

        let numberRegEx  = ".*[0-9]+.*"
        let checkForNumber = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberResult = checkForNumber.evaluate(with: text)

        return capitalResult && lowerCaseResult && numberResult
    }

    func isConfirmPasswordValid(_ password: String?, _ confirmPassword: String?) -> Bool {
        return password == confirmPassword
    }

    func showInvalidField() {
        //person clicks sign up before they even enter shit fill in all blank fields make it all red and tell them to do their shit
    }
}

protocol RegisterViewModelDelegate: class {
    func showAlert(data: AlertManager.Data)
}
