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

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var hintLabel: UILabel!

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
        titleLabel.text = data.title
        hintLabel.text = data.hint
        mode = data.mode

        textField.isSecureTextEntry = mode == .password
        textField.autocorrectionType = .no
        textField.clearButtonMode = .never
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        textField.tintColor = .lightGray
        textField.setLeftIcon(data.leftIconImage)

        setupRightButton(data)
    }

    // MARK: - Methods

    func setupRightButton(_ data: Data) {
        let button = textField.setRightIcon(data.rightIconImage)

        switch data.rightButtonType {
        case .password:
            button?.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        case .none:
            return
        }
    }

    @objc private func togglePassword() {
        mode = mode == .password ? .normal : .password
        textField.isSecureTextEntry = mode == .password
    }

    @objc private func editingChanged() {
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

    enum RightButtonType {
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
        var title: String?
        var hint: String?
        var mode: Mode
        var leftIconImage: UIImage?
        var rightIconImage: UIImage?
        var rightButtonType: RightButtonType?

        init(keyboardType: UIKeyboardType,
             title: String?,
             hint: String?,
             mode: Mode,
             leftIconImage: UIImage? = nil,
             rightIconImage: UIImage? = nil,
             rightButtonType: RightButtonType? = nil) {
            self.keyboardType = keyboardType
            self.title = title
            self.hint = hint
            self.mode = mode
            self.leftIconImage = leftIconImage
            self.rightIconImage = rightIconImage
            self.rightButtonType = .password
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
