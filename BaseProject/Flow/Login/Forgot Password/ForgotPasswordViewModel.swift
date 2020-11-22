//
//  ForgotPasswordViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-21.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class ForgotPasswordViewModel {
    // MARK: - Properties

    let builder = ForgotPasswordBuilder()
    var delegate: ForgotPasswordViewModelDelegate?

    var isValidEmail = false {
        willSet {
            newValue == true
            ? delegate?.forgotPasswordButtonState(.enabled)
            : delegate?.forgotPasswordButtonState(.disabled)
        }
    }

    func configure(delegate: ForgotPasswordViewModelDelegate) {
        self.delegate = delegate
    }

    func forgotPasswordViewData() -> GeneralTextView.Data {
        return builder.forgotPasswordViewData()
    }

    func showInvalidEmail() -> AlertManager.Data {
        return builder.buildInvalidEmailData()
    }
}

extension ForgotPasswordViewModel: GeneralTextViewDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    func editingChange(_ textField: UITextField) {
        isValidEmail = textField.text?.isValidEmail() == true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {}
    func textFieldDidEndEditing(_ textField: UITextField) {}
}

protocol ForgotPasswordViewModelDelegate: class {
    func forgotPasswordButtonState(_ state: ButtonState)
}
