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
    let builder = RegisterBuilder()

    // MARK: - Configuration

    func configure(delegate: RegisterViewModelDelegate) {
        self.delegate = delegate
    }

    func emailData() -> GeneralTextView.Data {
        return builder.buildEmailData()
    }

    func passwordData() -> GeneralTextView.Data {
        return builder.buildPasswordData()
    }

    func confirmPasswordData() -> GeneralTextView.Data {
        return builder.buildConfirmPasswordData()
    }
}

extension RegisterViewModel: GeneralTextViewDelegate {
    
    func editingChange(_ textField: UITextField) {
        delegate?.isValidInputs() == true
        ? delegate?.accountButtonState(.enabled)
        : delegate?.accountButtonState(.disabled)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {}

    func textFieldDidEndEditing(_ textField: UITextField) {}

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

protocol RegisterViewModelDelegate: class {
    func showAlert(data: AlertManager.Data)
    func accountButtonState(_ state: ButtonState)
    func isValidInputs() -> Bool
    var isEmailValid: Bool { get }
    var isPasswordValid: Bool { get }
    var isPasswordMatch: Bool { get }
}
