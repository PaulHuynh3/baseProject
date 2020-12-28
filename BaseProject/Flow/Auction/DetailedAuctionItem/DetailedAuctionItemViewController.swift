//
//  DetailedAuctionItemViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DetailedAuctionItemViewController: UIViewController {
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var offerButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    private var auctionPictureViewController: AuctionPictureCollectionController?
    private var viewModel = DetailedAuctionItemViewModel()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let auctionPictureViewController = segue.destination as? AuctionPictureCollectionController {
            self.auctionPictureViewController = auctionPictureViewController
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        auctionPictureViewController?.configure(data: viewModel.data)
        offerButton.centerTextVertically(padding: 5)
        saveButton.centerTextVertically(padding: 5)
        shareButton.centerTextVertically(padding: 5)
    }

    override func viewDidDisappear(_ animated: Bool) {
        viewModel.invalidateTimer()
    }

    func configure(data: MarketProduct) {
        viewModel.configure(delegate: self, data: data)
    }

}

extension DetailedAuctionItemViewController: DetailedAuctionItemViewModelDelegate {
    func updateCountDown(with timeString: String) {
        countDownLabel.text = timeString
    }
}
