//
//  DriverRegistrationViewController.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var emailTextFieldView: GeneralTextView!
    @IBOutlet weak var passwordTextFieldView: GeneralTextView!

    var isEmailValid: Bool {
        viewModel.isEmailValid(emailTextFieldView.textField)
    }

    var isPasswordValid: Bool {
        viewModel.isPasswordValid(passwordTextFieldView.textField)
    }

    var viewModel = LoginViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(delegate: self)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        emailTextFieldView.configure(data: viewModel.emailTextViewData(), delegate: viewModel)
        passwordTextFieldView.configure(data: viewModel.passwordTextViewData(), delegate: viewModel)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func loginTapped(_ sender: Any) {
        emailTextFieldView.setPotentialError(viewModel.emailValidation(emailTextFieldView.textField))
        passwordTextFieldView.setPotentialError(viewModel.passwordValidation(passwordTextFieldView.textField))
        guard isEmailValid || isPasswordValid else { return }

        //Look into database and check there.. If its successful then navigate
        viewModel.showCredentialError()
    }


    @IBAction func signInWithFacebookTapped(_ sender: Any) {
    }

    @IBAction func signInWithGoogleTapped(_ sender: Any) {

    }

    @IBAction func forgotPasswordTapped(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordSegue", sender: nil)
    }


    @IBAction func createAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: "createAccountSegue", sender: nil)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func showAlert(data: AlertManager.Data) {
        AlertManager.show(in: self, with: data)
    }
}
