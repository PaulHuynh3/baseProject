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

    @IBAction func bidTapped(_ sender: Any) {
        guard let dismissableController = UIStoryboard(name: String(describing: DismissableOfferViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DismissableOfferViewController.self)) as? DismissableOfferViewController else { return }
        dismissableController.configure(delegate: self, data: viewModel.buildDismissableData())
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
            //set background colour to back if you want.. with alpha of 0.5
        }) { _ in
            self.present(dismissableController, animated: true, completion: nil)
        }
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

extension DetailedAuctionItemViewController: DismissableViewControllerDelegate {
    func dismiss() {
        dismiss(animated: false, completion: nil)
    }
}
