//
//  ForgotPasswordViewController.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-28.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    // MARK: - Properties
    let viewModel = ForgotPasswordViewModel()
    @IBOutlet weak var forgotPasswordDataView: GeneralTextView!
    @IBOutlet weak var resetPasswordButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(delegate: self)
        setup()
    }

    func setup() {
        forgotPasswordButtonState(.disabled)
        forgotPasswordDataView.configure(data: viewModel.forgotPasswordViewData(), delegate: viewModel)
    }

    @IBAction func resetPasswordTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewModelDelegate {
    func forgotPasswordButtonState(_ state: ButtonState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
             switch state {
             case .enabled:
                self.resetPasswordButton.backgroundColor = UIColor.ColourTheme.orangeButton.colour
                self.resetPasswordButton.isEnabled = true
             case .disabled:
                self.resetPasswordButton.backgroundColor = UIColor.ColourTheme.disabledButton.colour
                self.resetPasswordButton.isEnabled = false
            }
        }
    }
}
