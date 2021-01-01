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
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var priceTextView: UITextView!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var conditionButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!

    let padding = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        configureBorderWidth()
        configureBorderColour()
        alignImageRightEdge()
        configureCornerRadius()
    }

    private func configureBorderColour() {
        let borderColor = UIColor.lightGray.cgColor
        addPhotoButton.layer.borderColor = borderColor
        titleTextView.layer.borderColor = borderColor
        priceTextView.layer.borderColor = borderColor
        categoryButton.layer.borderColor = borderColor
        conditionButton.layer.borderColor = borderColor
        locationButton.layer.borderColor = borderColor
        descriptionTextView.layer.borderColor = borderColor
    }

    private func configureBorderWidth() {
        let borderWidth = 1
        addPhotoButton.layer.borderWidth = CGFloat(borderWidth)
        titleTextView.layer.borderWidth = CGFloat(borderWidth)
        priceTextView.layer.borderWidth = CGFloat(borderWidth)
        categoryButton.layer.borderWidth = CGFloat(borderWidth)
        conditionButton.layer.borderWidth = CGFloat(borderWidth)
        locationButton.layer.borderWidth = CGFloat(borderWidth)
        descriptionTextView.layer.borderWidth = CGFloat(borderWidth)
    }

    private func configureCornerRadius() {
        let cornerRadius = 5.0
        addPhotoButton.layer.cornerRadius = CGFloat(cornerRadius)
        titleTextView.layer.cornerRadius = CGFloat(cornerRadius)
        priceTextView.layer.cornerRadius = CGFloat(cornerRadius)
        categoryButton.layer.cornerRadius = CGFloat(cornerRadius)
        conditionButton.layer.cornerRadius = CGFloat(cornerRadius)
        locationButton.layer.cornerRadius = CGFloat(cornerRadius)
        descriptionTextView.layer.cornerRadius = CGFloat(cornerRadius)
    }

    private func alignImageRightEdge() {
        categoryButton.alignImageRightEdge()
        conditionButton.alignImageRightEdge()
        locationButton.alignImageRightEdge()
    }

    @IBAction func addPhotosTapped(_ sender: Any) {

        //hide button when user selects an image, unhide button when user deselect image.
    }


}
