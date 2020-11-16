//
//  GeneralTextField.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-11-12.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class GeneralTextView: UIView, NibOwnerLoadable {
    // MARK: - IBOulets

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet weak var passwordToggleButton: UIButton!

    private var mode = Mode.normal
    private var potentialErrorText: String? {
        didSet {
            handleError()
        }
    }
    private var delegate: GeneralTextViewDelegate?

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNibContent()
        textField.delegate = self
    }

    // MARK: - Configuration

    func configure(data: Data, delegate: GeneralTextViewDelegate?) {
        self.delegate = delegate
        textField.keyboardType = data.keyboardType
        nameLabel.text = data.nameLabel
        hintLabel.text = data.hintLabel
        mode = data.mode
        passwordToggleButton.isHidden = data.hidePasswordToggle ?? true

        textField.isSecureTextEntry = mode == .password
        textField.autocorrectionType = .no
        textField.clearButtonMode = .never
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    @IBAction func passwordToggleTapped(_ sender: Any) {
        mode = mode == .password ? .normal : .password
        textField.isSecureTextEntry = mode == .password
    }

    // MARK: - Methods

    @objc func editingChanged() {
        delegate?.editingChange(textField)
    }

    func setPotentialError(_ message: String?) {
        potentialErrorText = message
    }

    private func handleError() {
        updateText()
        updateColour()
    }

    private func updateColour() {
        hintLabel.textColor = potentialErrorText == nil ? .gray : .red
    }

    private func updateText() {
        hintLabel.text = potentialErrorText
    }
}

extension GeneralTextView {
    enum Mode {
        case normal
        case password
    }
}

extension GeneralTextView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing(textField)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(textField)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn(textField) ?? true
    }
}

extension GeneralTextView {
    struct Data {
        var keyboardType: UIKeyboardType
        var nameLabel: String?
        var hintLabel: String?
        var mode: Mode
        var hidePasswordToggle: Bool?

        init(keyboardType: UIKeyboardType,
             nameLabel: String?,
             hintLabel: String?,
             mode: Mode,
             hidePasswordToggle: Bool = true) {
            self.keyboardType = keyboardType
            self.nameLabel = nameLabel
            self.hintLabel = hintLabel
            self.mode = mode
            self.hidePasswordToggle = hidePasswordToggle
        }
    }
}


protocol GeneralTextViewDelegate: class {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func textFieldDidBeginEditing(_ textField: UITextField)
    func textFieldDidEndEditing(_ textField: UITextField)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    func editingChange(_ textField: UITextField)
}
