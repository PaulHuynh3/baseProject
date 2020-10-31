//
//  DriverRegistrationViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    var loginViewModel = LoginViewModel()

    // MARK: - ViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.configure(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func loginTapped(_ sender: Any) {

    }


    @IBAction func forgotPasswordTapped(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordSegue", sender: nil)
    }


    @IBAction func createAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: "createAccountSegue", sender: nil)
    }
}

extension LoginViewController: LoginViewModelDelegate {

}
