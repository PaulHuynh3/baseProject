//
//  DismissableViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-28.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DismissableViewController: UIViewController {

    var delegate: DismissableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //have different enums
        //enums: bid, condition -> depending on it show pre-defined shit
    }

    @IBAction func dismissTapped(_ sender: Any) {
        self.delegate?.dismiss()
    }

    func configure(delegate: DismissableViewControllerDelegate) {
        self.delegate = delegate
    }
}

extension DismissableViewController: TableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

protocol DismissableViewControllerDelegate {
    func dismiss()
}
