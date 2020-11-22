//
//  IntroductionViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class PassiveLoadingViewController: UIViewController {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var passiveIncomeLabel: UILabel!

    var delegate: PassiveLoadingViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        bounceAnimation()
        removeContainer()
    }

    func bounceAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.carImageView.bounds = CGRect(x: self.carImageView.bounds.origin.x, y: self.carImageView.bounds.origin.y, width: self.carImageView.bounds.size.width + 60, height: self.carImageView.bounds.size.height)
        })
    }

    func configure(delegate: PassiveLoadingViewControllerDelegate) {
        self.delegate = delegate
    }

    func removeContainer() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {  // + .seconds(2)
            self.delegate?.removeContainerViewController()
        }
    }
}


protocol PassiveLoadingViewControllerDelegate {
    func removeContainerViewController()
}
