//
//  DetailedAuctionItemViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit
import MapKit

class DetailedAuctionItemViewController: UIViewController {
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var offerButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!

    private var auctionPictureViewController: AuctionPictureCollectionController?
    private var viewModel = DetailedAuctionItemViewModel()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let auctionPictureViewController = segue.destination as? AuctionPictureCollectionController {
            self.auctionPictureViewController = auctionPictureViewController
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
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

    private func setupMap() {
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initialLocation)
    }
}

extension DetailedAuctionItemViewController: DetailedAuctionItemViewModelDelegate {
    func updateCountDown(with timeString: String) {
        countDownLabel.text = timeString
    }
}

extension MKMapView {
    func centerToLocation(
      _ location: CLLocation,
      regionRadius: CLLocationDistance = 1000
    ) {
      let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius)
      setRegion(coordinateRegion, animated: true)
    }
}
