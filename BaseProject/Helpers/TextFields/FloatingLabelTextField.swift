//
//  FloatingLabelTextField.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-30.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class FloatingLabelTextField: UITextField {
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero)
    var floatingLabelHeight: CGFloat = 5
    var errorPlaceholder: String?

    @IBInspectable
    var _placeholder: String?

    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.black {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }

    @IBInspectable
    var floatingErrorColor: UIColor = UIColor.red {
        didSet {
            self.floatingLabel.textColor = floatingErrorColor
            self.setNeedsDisplay()
        }
    }

    @IBInspectable
    var floatingLabelFont: UIFont = UIFont(name: "Helvetica Neue", size: 9)! {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }

    @IBInspectable
    var activeBorderColor: UIColor = UIColor.blue

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _placeholder = (self._placeholder != nil) ? self._placeholder : placeholder
        placeholder = self._placeholder
        floatingLabel = UILabel(frame: CGRect.zero)
        addTarget(self, action: #selector(addFloatingLabel), for: .editingChanged)
        addTarget(self, action: #selector(removeFloatingLabel), for: .editingDidEnd)
    }

    @objc func addFloatingLabel() {
        floatingLabel.textColor = errorPlaceholder == nil ? floatingLabelColor : floatingErrorColor
        floatingLabel.font = floatingLabelFont
        floatingLabel.text = errorPlaceholder == nil ? _placeholder : errorPlaceholder
        floatingLabel.layer.backgroundColor = UIColor.white.cgColor
        floatingLabel.translatesAutoresizingMaskIntoConstraints = false
        floatingLabel.clipsToBounds = true
        floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 5)
        layer.borderColor = self.activeBorderColor.cgColor
        addSubview(self.floatingLabel)

        floatingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        floatingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true

        // Remove the placeholder
        placeholder = ""
        self.setNeedsDisplay()
    }

    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 0.13) {
               self.subviews.forEach{ $0.removeFromSuperview() }
               self.setNeedsDisplay()
            }
            placeholder = _placeholder //this
        }
        layer.borderColor = UIColor.black.cgColor
    }
}
