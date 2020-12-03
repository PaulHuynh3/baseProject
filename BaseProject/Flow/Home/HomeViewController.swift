//
//  HomeViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-10-02.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//       showPassiveLoadingViewController()
    }

    lazy var burgerMenuViewController: BurgerMenuViewController? = {
        let burgerMenuViewController = UIStoryboard(name: StoryboardNavigation.BurgerMenu.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: BurgerMenuViewController.self)) as? BurgerMenuViewController
        burgerMenuViewController?.delegate = self
        return burgerMenuViewController
    }()


    private func showPassiveLoadingViewController() {
        guard let passiveLoadingViewController = UIStoryboard(name: StoryboardNavigation.Root.rawValue, bundle: nil).instantiateViewController(withIdentifier:  String(describing: PassiveLoadingViewController.self)) as? PassiveLoadingViewController else { return }
        present(passiveLoadingViewController, animated: true, completion: nil)
    }

    private func showBurgerSideMenu() {
        guard let burgerMenuViewController = burgerMenuViewController else { return }
        burgerMenuViewController.transitioningDelegate = burgerMenuViewController
        burgerMenuViewController.modalPresentationStyle = .custom

        present(burgerMenuViewController, animated: true, completion: nil)
    }

    @IBAction func burgetMenuTapped(_ sender: Any) {
        showBurgerSideMenu()
    }
}

extension HomeViewController: BurgerMenuDelegate {

}
