//
//  EditAccountViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-30.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!

    var fieldName: String?
    var myText: String?
    var myTextFieldUpdated: ((_ newText: String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = fieldName
        myTextField.text = myText
    }

    @IBAction func update(_ sender: Any)
    {
        myTextFieldUpdated?(myTextField.text!)
        navigationController?.popViewController(animated: true)
    }

}
