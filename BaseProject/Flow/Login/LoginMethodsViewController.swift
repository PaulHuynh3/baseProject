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

    @IBAction func connectFacebookTapped(_ sender: Any) {
        guard let tabBarViewController = UIStoryboard(name: StoryboardNavigation.Root.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: RootViewController.self)) as? RootViewController else { return }

        UIApplication.shared.delegate?.window??.rootViewController = tabBarViewController
    }

    @IBAction func connecGmailTapped(_ sender: Any) {

    }

    @IBAction func loginTapped(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }

    
}
