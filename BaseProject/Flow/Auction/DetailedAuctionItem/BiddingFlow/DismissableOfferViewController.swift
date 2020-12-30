//
//  DismissableViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-28.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DismissableOfferViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var marketPriceLabel: UILabel!
    @IBOutlet weak var offerTextField: UITextField!
    @IBOutlet weak var confirmBidButton: UIButton!
    @IBOutlet weak var discretionLabel: UILabel!

    var offerPriceString: String? {
        return offerTextField.text?.replacingOccurrences(of: "$", with: "")
    }
    var delegate: DismissableViewControllerDelegate?

    private var data: DismissableData?
    private var offerBidConfirmCallback: ((Int) -> Void)?
    private var marketPrice: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func dismissTapped(_ sender: Any) {
        self.delegate?.dismiss()
    }

    private func setup() {
        setupTextField()
        titleLabel.text = data?.dismissableTitle
        let price = data?.marketProduct?.price ?? 0
        marketPriceLabel.text = "Current Price: " + "$" + String(price)
        offerTextField.text = "$" + String(price + 10)
        offerBidConfirmCallback = data?.offerBidConfirmCallback
        marketPrice = data?.marketProduct?.price
    }

    private func setupTextField() {
        offerTextField.delegate = self
        offerTextField.keyboardType = .numberPad
        offerTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    private func setValidationState() {
        guard let bidPriceString = offerPriceString,
              let bidPrice = Int(bidPriceString),
              let marketPrice = marketPrice else { return }
        let isBidHigher = bidPrice > marketPrice
        confirmBidButton.isEnabled = isBidHigher
        confirmBidButton.alpha = isBidHigher ? 1 : 0.3
        discretionLabel.text = isBidHigher
                                ? "Your bid will be fulfilled if it maintains the highest price at the deadline."
                                : "Please enter a bid higher than the market price"
        discretionLabel.textColor = isBidHigher
                                    ? .black
                                    : .red
    }

    func configure(delegate: DismissableViewControllerDelegate, data: DismissableData) {
        self.delegate = delegate
        self.data = data
    }

    @IBAction func confirmBidTapped(_ sender: Any) {
        guard let bidPriceString = offerPriceString, let bidPrice = Int(bidPriceString) else { return }
        offerBidConfirmCallback?(bidPrice)
        delegate?.dismiss()
    }

    @IBAction func exitTapped(_ sender: Any) {
        delegate?.dismiss()
    }
}

extension DismissableOfferViewController: UITextFieldDelegate {
    @objc func editingChanged() {
        setValidationState()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.count == 1 && string == "" {
            return false
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {}
    func textFieldDidEndEditing(_ textField: UITextField) {}
}

protocol DismissableViewControllerDelegate {
    func dismiss()
}

struct DismissableData {
    let dismissableTitle: String
    let marketProduct: Product?
    let offerBidConfirmCallback: ((Int) -> Void)?
}
