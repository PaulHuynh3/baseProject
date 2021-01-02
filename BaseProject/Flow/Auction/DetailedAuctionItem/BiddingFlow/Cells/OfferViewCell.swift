//
//  OfferViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-31.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class OfferViewCell: UITableViewCell {

    @IBOutlet weak var marketPriceLabel: UILabel!
    @IBOutlet weak var offerTextField: UITextField!
    @IBOutlet weak var confirmBidButton: UIButton!
    @IBOutlet weak var discretionLabel: UILabel!

    var offerPriceString: String? {
        return offerTextField.text?.replacingOccurrences(of: "$", with: "")
    }
    private var marketPrice: Int?
    private var dismissCallback: (() -> Void)?
    private var offerBidConfirmCallback: ((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        //TODO - Keep watch to see if this cause potential problems with the keyboard.
        offerTextField.becomeFirstResponder()
    }

    func configure(data: Data?, dismissCallback: (() -> Void)?) {
        setupTextField()
        let price = data?.marketProduct?.price ?? 0
        marketPriceLabel.text = "Current Price: " + "$" + String(price)
        offerTextField.text = "$" + String(price + 10)
        offerBidConfirmCallback = data?.offerBidConfirmCallback
        self.dismissCallback = dismissCallback
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

    @IBAction func confirmBidTapped(_ sender: Any) {
        guard let bidPriceString = offerPriceString, let bidPrice = Int(bidPriceString) else { return }
        offerBidConfirmCallback?(bidPrice)
        dismissCallback?()
    }
}

extension OfferViewCell: UITextFieldDelegate {
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

extension OfferViewCell {
    struct Data {
        let marketProduct: Product?
        let offerBidConfirmCallback: ((Int) -> Void)?
    }
}
