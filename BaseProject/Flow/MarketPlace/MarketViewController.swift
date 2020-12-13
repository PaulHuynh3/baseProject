//
//  MarketPlaceViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-04.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //set up a new viewcontrollere here and load it in and configure its delegate
        guard let marketResultsViewController = UIStoryboard(name: StoryboardNavigation.MarketResultsViewController.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: MarketResultsViewController.self)) as? MarketResultsViewController else { return }
        marketResultsViewController.configure(delegate: self, mode: .featured)
    }

}

extension MarketViewController: MarketResultsViewControllerDelegate {
    func navigateToSelectedItem() {
        //needs the products path etc
        //open up the product and send them
    }
}
