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
        guard let marketResultsViewController = UIStoryboard(name: String(describing: MarketResultsViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: MarketResultsViewController.self)) as? MarketResultsViewController else { return }
        marketResultsViewController.configure(mode: .featured)
    }

}
