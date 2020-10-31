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

    @IBOutlet weak var firstNameTextfield: FloatingLabelTextField!
    @IBOutlet weak var lastNameTextfield: FloatingLabelTextField!
    @IBOutlet weak var emailTextfield: FloatingLabelTextField!
    @IBOutlet weak var passwordTextfield: FloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTextfield: FloatingLabelTextField!
    @IBOutlet weak var createAccountButton: UIButton!

    var isFirstNameValid: Bool {
        return viewModel.isValidNameTextfield(firstNameTextfield)
    }

    var isLastNameValid: Bool {
         return viewModel.isValidNameTextfield(lastNameTextfield)
    }

    var isEmailValid: Bool {
        return viewModel.isValidEmailTextfield(emailTextfield.text)
    }

    var isPasswordValid: Bool {
        return viewModel.isValidPassword(passwordTextfield.text)
    }

    var isConfirmPasswordValid: Bool {
        return viewModel.isConfirmPasswordValid(passwordTextfield.text, confirmPasswordTextfield.text)
    }

    let viewModel = RegisterViewModel()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        setupBorder()
        setUpDelegate()
        createAccountEnabled()
    }

    private func setupBorder() {
        firstNameTextfield.layer.borderWidth = 1.0
        lastNameTextfield.layer.borderWidth = 1.0
        emailTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.borderWidth = 1.0
        confirmPasswordTextfield.layer.borderWidth = 1.0

        firstNameTextfield.layer.borderColor = UIColor.blue.cgColor
        lastNameTextfield.layer.borderColor = UIColor.blue.cgColor
        emailTextfield.layer.borderColor = UIColor.blue.cgColor
        passwordTextfield.layer.borderColor = UIColor.blue.cgColor
        confirmPasswordTextfield.layer.borderColor = UIColor.blue.cgColor
    }

    private func setUpDelegate() {
        firstNameTextfield.delegate = self
        lastNameTextfield.delegate = self
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        confirmPasswordTextfield.delegate = self
    }

    // MARK: - IBActions

    @IBAction func createAccountTapped(_ sender: Any) {

    }

    // MARK: - Methods

//    private func meetsRequiredStandard() -> Bool {
//
//    }

    func createAccountEnabled() {
        createAccountButton.isEnabled = isFirstNameValid && isLastNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid
    }
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {

    }

    func textFieldDidChangeSelection(_ textField: UITextField) {

    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)

            if textField == firstNameTextfield {
                firstNameTextfield.layer.borderColor = viewModel.isValidNameTextfield(firstNameTextfield)
                ? UIColor.blue.cgColor
                : UIColor.red.cgColor
            }

            if textField == lastNameTextfield {
                lastNameTextfield.layer.borderColor = viewModel.isValidNameTextfield(lastNameTextfield)
                ? UIColor.blue.cgColor
                : UIColor.red.cgColor
            }

            if textField == emailTextfield {
                emailTextfield.layer.borderColor = viewModel.isValidEmailTextfield(updatedText)
                ? UIColor.blue.cgColor
                : UIColor.red.cgColor
                emailTextfield.errorPlaceholder = viewModel.isValidEmailTextfield(updatedText)
                ? nil
                : "Please enter a valid email."
            }

            if textField == passwordTextfield {
                passwordTextfield.layer.borderColor = viewModel.isValidPassword(updatedText)
                ? UIColor.blue.cgColor
                : UIColor.red.cgColor

                passwordTextfield.errorPlaceholder = viewModel.isValidPassword(updatedText)
                ? nil
                : "Contain at least one uppercase letter and number"
            }

            if textField == confirmPasswordTextfield {
                confirmPasswordTextfield.layer.borderColor = viewModel.isConfirmPasswordValid(passwordTextfield.text, updatedText)
                    ? UIColor.blue.cgColor
                    : UIColor.red.cgColor

                confirmPasswordTextfield.errorPlaceholder = viewModel.isConfirmPasswordValid(passwordTextfield.text, updatedText)
                ? nil
                : "Password must match"
            }
        }
        return true
    }
}
