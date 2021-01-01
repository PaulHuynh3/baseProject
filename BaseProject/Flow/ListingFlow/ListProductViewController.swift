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
    @IBOutlet weak var descriptionTextField: UITextField!

    let viewModel = ListProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        viewModel.configure(delegate: self)
        configureBorderWidth()
        configureBorderColour()
        alignImageRightEdge()
        configureCornerRadius()
    }

    private func configureBorderColour() {
        let borderColor = UIColor.lightGray.cgColor
        addPhotoButton.layer.borderColor = borderColor
        titleTextField.layer.borderColor = borderColor
        priceTextField.layer.borderColor = borderColor
        categoryButton.layer.borderColor = borderColor
        conditionButton.layer.borderColor = borderColor
        locationButton.layer.borderColor = borderColor
        descriptionTextField.layer.borderColor = borderColor
    }

    private func configureBorderWidth() {
        let borderWidth = 1
        addPhotoButton.layer.borderWidth = CGFloat(borderWidth)
        titleTextField.layer.borderWidth = CGFloat(borderWidth)
        priceTextField.layer.borderWidth = CGFloat(borderWidth)
        categoryButton.layer.borderWidth = CGFloat(borderWidth)
        conditionButton.layer.borderWidth = CGFloat(borderWidth)
        locationButton.layer.borderWidth = CGFloat(borderWidth)
        descriptionTextField.layer.borderWidth = CGFloat(borderWidth)
    }

    private func configureCornerRadius() {
        let cornerRadius = 5.0
        addPhotoButton.layer.cornerRadius = CGFloat(cornerRadius)
        titleTextField.layer.cornerRadius = CGFloat(cornerRadius)
        priceTextField.layer.cornerRadius = CGFloat(cornerRadius)
        categoryButton.layer.cornerRadius = CGFloat(cornerRadius)
        conditionButton.layer.cornerRadius = CGFloat(cornerRadius)
        locationButton.layer.cornerRadius = CGFloat(cornerRadius)
        descriptionTextField.layer.cornerRadius = CGFloat(cornerRadius)
    }

    private func alignImageRightEdge() {
        categoryButton.alignImageRightEdge()
        conditionButton.alignImageRightEdge()
        locationButton.alignImageRightEdge()
    }

    @IBAction func addPhotosTapped(_ sender: Any) {

        //hide button when user selects an image, unhide button when user deselect image.
    }

    @IBAction func publishPostTapped(_ sender: Any) {

    }

    @IBAction func discardPostTapped(_ sender: Any) {
        AlertManager.show(in: self, with: viewModel.discardAlertData)
    }
}

extension ListProductViewController: ListProductViewModelDelegate {
    func discardPost() {
        navigationController?.popViewController(animated: true)
    }
}
