//
//  DismissableConditionViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-30.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DismissableConditionViewController: UIViewController {

    var delegate: DismissableConditionViewDelegate?

    override func viewDidLoad() {

    }

    func configure(delegate: DismissableConditionViewDelegate) {
        self.delegate = delegate
    }


    @IBAction func dismissTapped(_ sender: Any) {
        delegate?.dismissSheet()
    }

    struct Data {
        let dismissableTitle: String
    }


    /*
     New
     Brand new, never worn or used, undamaged item. Ideally in the original package (if original package isn't a plastic bag or handmade item).

     Used (like-new)
     Excellent condition, but it has previously been worn or used. No signs of wear or defects.

     Used (good)
     Some signs of wear. Item is operational and works as intended

     Used (fair)
     Some signs of wear and tear or minor defects. Item is still usable as intended. Includes items from households with animals or smoking (example: potential hair, stains, or smell)
     */
}

protocol DismissableConditionViewDelegate {
    func dismissSheet()
}
