//
//  ListProductViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class ListProductViewController: UIViewController {

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var conditionButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField! //TODO this might have to be a textView

    let viewModel = ListProductViewModel()
    var offerPriceString: String? {
        return priceTextField.text?.replacingOccurrences(of: "$", with: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func configure() {
        //enum .Auction, .Trade show auction shit depending
    }

    private func setup() {
        viewModel.configure(delegate: self)
        configureBorderWidth()
        configureBorderColour()
        alignImageRightEdge()
        configureCornerRadius()
        configureTextFields()
    }

    private func configureBorderColour() {
        addPhotoButton.layer.borderColor = viewModel.borderColour
        titleTextField.layer.borderColor = viewModel.borderColour
        priceTextField.layer.borderColor = viewModel.borderColour
        categoryButton.layer.borderColor = viewModel.borderColour
        conditionButton.layer.borderColor = viewModel.borderColour
        locationButton.layer.borderColor = viewModel.borderColour
        descriptionTextField.layer.borderColor = viewModel.borderColour
    }

    private func configureBorderWidth() {
        addPhotoButton.layer.borderWidth = viewModel.borderWidth
        titleTextField.layer.borderWidth = viewModel.borderWidth
        priceTextField.layer.borderWidth = viewModel.borderWidth
        categoryButton.layer.borderWidth = viewModel.borderWidth
        conditionButton.layer.borderWidth = viewModel.borderWidth
        locationButton.layer.borderWidth = viewModel.borderWidth
        descriptionTextField.layer.borderWidth = viewModel.borderWidth
    }

    private func configureCornerRadius() {
        addPhotoButton.layer.cornerRadius = viewModel.cornerRadius
        titleTextField.layer.cornerRadius = viewModel.cornerRadius
        priceTextField.layer.cornerRadius = viewModel.cornerRadius
        categoryButton.layer.cornerRadius = viewModel.cornerRadius
        conditionButton.layer.cornerRadius = viewModel.cornerRadius
        locationButton.layer.cornerRadius = viewModel.cornerRadius
        descriptionTextField.layer.cornerRadius = viewModel.cornerRadius
    }

    private func alignImageRightEdge() {
        categoryButton.alignImageRightEdge()
        conditionButton.alignImageRightEdge()
        locationButton.alignImageRightEdge()
    }

    private func configureTextFields() {
        titleTextField.delegate = self
        priceTextField.delegate = self
        priceTextField.keyboardType = .numberPad
    }

    @IBAction func addPhotosTapped(_ sender: Any) {
        //ask for access to gallery and have photo inside to use
        //hide button when user selects an image, unhide button when user deselect image.
    }

    @IBAction func categoryButtonTapped(_ sender: Any) {
        guard let dismissableController = viewModel.dismissableController else { return }
//        dismissableController.configure(delegate: self, data: viewModel.buildOfferData())
//        present(dismissableController, animated: true, completion: nil)
    }

    @IBAction func conditionButtonTapped(_ sender: Any) {
        guard let dismissableController = viewModel.dismissableController else { return }
        dismissableController.configure(delegate: self, data: viewModel.conditionSelectionDismissableData)
        present(dismissableController, animated: true, completion: nil)
    }

    @IBAction func locationButtonTapped(_ sender: Any) {

    }

    @IBAction func publishPostTapped(_ sender: Any) {
        //check that all fields are filled
        //highlight the fields that are not filled..
        if priceTextField.text == "", titleTextField.text == "" {

        }
    }

    @IBAction func discardPostTapped(_ sender: Any) {
        AlertManager.show(in: self, with: viewModel.discardAlertData)
    }
}

extension ListProductViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == priceTextField, textField.text?.count == 1 && string == "" {
            return false
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == priceTextField, textField.text?.count == 0 {
            textField.text = "$"
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == priceTextField, textField.text?.count == 1 {
            textField.text = nil
        }
    }
}

extension ListProductViewController: DismissableViewControllerDelegate {
    func dismissSheet() {
        dismissViewController()
    }
}

extension ListProductViewController: ListProductViewModelDelegate {
    func dismissViewController() {
        dismiss(animated: true)
    }

    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
