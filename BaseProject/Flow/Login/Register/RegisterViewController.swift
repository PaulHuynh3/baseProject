//
//  RegisterViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-28.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewModelDelegate {
    // MARK: - Properties

    @IBOutlet weak var emailTextFieldView: GeneralTextView!
    @IBOutlet weak var passwordTextFieldView: GeneralTextView!
    @IBOutlet weak var confirmPasswordTextFieldView: GeneralTextView!

    @IBOutlet weak var createAccountButton: UIButton!

    let viewModel = RegisterViewModel()

    var isEmailValid: Bool {
        emailTextFieldView.textField.text?.isValidEmail() ?? false
    }

    var isPasswordValid: Bool {
        passwordTextFieldView.textField.text?.isValidPassword() ?? false
    }

    var isPasswordMatch: Bool {
        passwordTextFieldView.textField.text == confirmPasswordTextFieldView.textField.text
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        viewModel.configure(delegate: self)
        configureTextFieldViews()
        accountButtonState(.disabled)
    }

    // MARK: - IBActions

    @IBAction func createAccountTapped(_ sender: Any) {

    }

    // MARK: - Methods

    private func configureTextFieldViews() {
        emailTextFieldView.configure(data: viewModel.emailData(), delegate: viewModel)
        passwordTextFieldView.configure(data: viewModel.passwordData(), delegate: viewModel)
        confirmPasswordTextFieldView.configure(data: viewModel.confirmPasswordData(), delegate: viewModel)
    }

    func isValidInputs() -> Bool {
        return isEmailValid && isPasswordValid && isPasswordMatch
    }

    func accountButtonState(_ state: ButtonState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
             switch state {
             case .enabled:
                self.createAccountButton.backgroundColor = UIColor.ColourTheme.orangeButton.colour
                self.createAccountButton.isEnabled = true
             case .disabled:
                self.createAccountButton.backgroundColor = UIColor.ColourTheme.disabledButton.colour
                self.createAccountButton.isEnabled = false
            }
        }
    }

    func showAlert(data: AlertManager.Data) {
        //show alert for any error when registering
    }
}

