//
//  Extensions.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-20.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cell identifier: T.Type, in tableView: UITableView, for indexPath: IndexPath) -> T {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: identifier), for: indexPath) as! T
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let checkForCapital = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalResult = checkForCapital.evaluate(with: self)

        let lowerLetterRegEx = ".*[a-z]+.*"
        let checkForLowerCase = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
        let lowerCaseResult = checkForLowerCase.evaluate(with: self)

        let numberRegEx  = ".*[0-9]+.*"
        let checkForNumber = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberResult = checkForNumber.evaluate(with: self)

        let specialCharacterRegEx  = ".*[!@#$%^&*()-_+=]+.*"
        let checkForSpecialText = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialResult = checkForSpecialText.evaluate(with: self)

        let requiredLengthRegEx = ".*.{8}+.*"
        let checkForRequiredLength = NSPredicate(format:"SELF MATCHES %@", requiredLengthRegEx)
        let requiredLengthResult = checkForRequiredLength.evaluate(with: self)

        return capitalResult && lowerCaseResult && numberResult && specialResult && requiredLengthResult
    }
}

extension UITextField {
    enum TextFieldType {
        case email
        case password
    }

    func checkInput(type: TextFieldType) {
        var isValid = false
        switch type {
        case .email:
            isValid = self.text?.isValidEmail() == true
        case .password:
            isValid = self.text?.isValidEmail() == true
        }
        self.layer.borderWidth = isValid ? 0 : 0.5
        self.layer.borderColor = isValid ? UIColor.clear.cgColor : UIColor.red.cgColor
    }
}

extension UIColor {

    enum ColourTheme {
        case disabledButton
        case orangeButton

        var colour: UIColor {
            switch self {
            case .disabledButton:
                return UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.75)

            case .orangeButton:
                return UIColor(red: 231/255, green: 178/255, blue: 62/255, alpha: 1)
            }
        }
    }

}
