//
//  RegisterViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-28.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

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
        configureTextFieldViews()
        accountButtonState(.disabled)
    }

    // MARK: - IBActions

    @IBAction func createAccountTapped(_ sender: Any) {

    }

    // MARK: - Methods

    private func configureTextFieldViews() {
        emailTextFieldView.configure(data: viewModel.emailData(), delegate: nil)
        passwordTextFieldView.configure(data: viewModel.passwordData(), delegate: self)
        confirmPasswordTextFieldView.configure(data: viewModel.confirmPasswordData(), delegate: self)
    }

    private func accountButtonState(_ state: CreateAccountButtonState) {
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

    private func validation() {
        isEmailValid && isPasswordValid && isPasswordMatch
            ? accountButtonState(.enabled)
            : accountButtonState(.disabled)
    }
}

extension RegisterViewController: GeneralTextViewDelegate {
    func editingChange(_ textField: UITextField) {
        isEmailValid && isPasswordValid && isPasswordMatch
            ? accountButtonState(.enabled)
            : accountButtonState(.disabled)
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
