//
//  ListProductViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class ListProductViewController: UIViewController {

    @IBOutlet weak var photoContainerView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var conditionButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!

    let viewModel = ListProductViewModel()
    var offerPriceString: String? {
        return priceTextField.text?.replacingOccurrences(of: "$", with: "")
    }
    var photoCollectionViewController: PhotoCollectionViewController?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoCollectionViewController = segue.destination as? PhotoCollectionViewController {
            self.photoCollectionViewController = photoCollectionViewController
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        photoCollectionViewController.configure()
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
        setupKeyboard()
    }

    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardWhenTappedAround()
    }

    private func configureBorderColour() {
        photoContainerView.layer.borderColor = viewModel.borderColour
        titleTextField.layer.borderColor = viewModel.borderColour
        priceTextField.layer.borderColor = viewModel.borderColour
        categoryButton.layer.borderColor = viewModel.borderColour
        conditionButton.layer.borderColor = viewModel.borderColour
        locationButton.layer.borderColor = viewModel.borderColour
        descriptionTextView.layer.borderColor = viewModel.borderColour
    }

    private func configureBorderWidth() {
        photoContainerView.layer.borderWidth = viewModel.borderWidth
        priceTextField.layer.borderWidth = viewModel.borderWidth
        categoryButton.layer.borderWidth = viewModel.borderWidth
        conditionButton.layer.borderWidth = viewModel.borderWidth
        locationButton.layer.borderWidth = viewModel.borderWidth
        descriptionTextView.layer.borderWidth = viewModel.borderWidth
    }

    private func configureCornerRadius() {
        photoContainerView.layer.cornerRadius = viewModel.cornerRadius
        priceTextField.layer.cornerRadius = viewModel.cornerRadius
        categoryButton.layer.cornerRadius = viewModel.cornerRadius
        conditionButton.layer.cornerRadius = viewModel.cornerRadius
        locationButton.layer.cornerRadius = viewModel.cornerRadius
        descriptionTextView.layer.cornerRadius = viewModel.cornerRadius
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

        descriptionTextView.delegate = self
        descriptionTextView.text = "Description"
        descriptionTextView.textColor = UIColor.lightGray
    }

    @objc func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }

    @IBAction func categoryButtonTapped(_ sender: Any) {
        guard let dismissableController = viewModel.dismissableController else { return }
        dismissableController.configure(delegate: self, data: viewModel.categorySelectionDismissableData)
        present(dismissableController, animated: true, completion: nil)
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
        if priceTextField.text == nil, titleTextField.text == nil, viewModel.condition == nil {

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
        dismissKeyboard()
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

extension ListProductViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Description"
            descriptionTextView.textColor = UIColor.lightGray
        }
    }
}

extension ListProductViewController: DismissableViewControllerDelegate {
    func dismissSheet() {
        dismissViewController()
    }
}

extension ListProductViewController: ListProductViewModelDelegate {
    func update(category: Category) {
        categoryButton.setTitle(category.title, for: .normal)
    }

    func update(condition: Condition) {
        conditionButton.setTitle(condition.title, for: .normal)
    }

    func dismissViewController() {
        dismiss(animated: true)
    }

    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
