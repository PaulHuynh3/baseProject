//
//  RootViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var passiveLoadingView: UIView!
    @IBOutlet weak var baseView: UIView!


    var passiveLoadingViewController: PassiveLoadingViewController?
    var baseViewController: TabBarViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PassiveLoadingViewController {
            passiveLoadingViewController = destination
            passiveLoadingViewController?.configure(delegate: self)
        }

        if let destination = segue.destination as? TabBarViewController {
            baseViewController = destination
        }
    }
}

extension RootViewController: PassiveLoadingViewControllerDelegate {
    func removeContainerViewController() {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.passiveLoadingView.removeFromSuperview()
            self.passiveLoadingView = nil
            self.passiveLoadingViewController = nil
        })
    }
}
