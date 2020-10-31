//
//  PasswordSentViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-28.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class PasswordSentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func passwordSentConfirmationTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
