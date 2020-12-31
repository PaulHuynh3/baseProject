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
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var bidPriceLabel: UILabel!
    @IBOutlet weak var conditionButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!

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
        setup()
        auctionPictureViewController?.configure(data: viewModel.data)
        offerButton.centerTextVertically(padding: 5)
        saveButton.centerTextVertically(padding: 5)
        shareButton.centerTextVertically(padding: 5)
    }

    override func viewDidDisappear(_ animated: Bool) {
        viewModel.invalidateTimer()
    }

    func configure(data: Product) {
        viewModel.configure(delegate: self, data: data)
    }

    private func setup() {
        setupMap()
        setupLabels()
    }

    private func setupLabels() {
        itemTitleLabel.text = viewModel.data?.title
        bidPriceLabel.text = "Bid: $" + String(viewModel.data?.price ?? 0)
        conditionButton.setTitle(viewModel.data?.condition.identifier, for: .normal)
        conditionButton.alignImageRightEdge()
        descriptionLabel.text = viewModel.data?.description
    }

    private func setupMap() {
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initialLocation)
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

    @IBAction func itemConditionTapped(_ sender: Any) {
        //pop up sheet no trigger
        guard let dismissableController = UIStoryboard(name: String(describing: DismissableConditionViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: DismissableConditionViewController.self)) as? DismissableConditionViewController else { return }
        dismissableController.configure(delegate: self)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
            //set background colour to back if you want.. with alpha of 0.5
        }) { _ in
            self.present(dismissableController, animated: true, completion: nil)
        }
    }
}

extension DetailedAuctionItemViewController: DetailedAuctionItemViewModelDelegate {
    func updateCountDown(with timeString: String) {
        countDownLabel.text = timeString
    }

    func updateBid(with price: Int) {
        bidPriceLabel.text = "Bid: $" + String(price)
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

extension DetailedAuctionItemViewController: DismissableConditionViewDelegate {
    func dismissSheet() {
        dismiss(animated: false, completion: nil)
    }
}
