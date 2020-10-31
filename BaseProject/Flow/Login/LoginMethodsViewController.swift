//
//  LoginAlternativesViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-28.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class LoginMethodsViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    //connect with google and facebook sdk
    //handle navigation if user logins

    @IBAction func connectFacebookTapped(_ sender: Any) {

    }

    @IBAction func connecGmailTapped(_ sender: Any) {

    }

    @IBAction func loginTapped(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }

    
}
