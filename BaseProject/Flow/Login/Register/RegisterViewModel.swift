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

enum CreateAccountButtonState {
    case enabled
    case disabled
}

protocol RegisterViewModelDelegate: class {
    func showAlert(data: AlertManager.Data)
}
