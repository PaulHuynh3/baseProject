//
//  ForgotPasswordViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-28.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func resetPasswordTapped(_ sender: Any) {
        guard emailTextfield.text?.isValidEmail() == true else {
            emailTextfield.checkInput(type: .email)
            return AlertManager.show(in: self, with: buildInvalidEmailData())
        }
        navigationController?.popToRootViewController(animated: true)
    }

    private func buildInvalidEmailData() -> AlertManager.Data {
        return AlertManager.Data(
            title: "Invalid Email",
            message: "Please enter a valid email",
            actions: nil
        )
    }
}
