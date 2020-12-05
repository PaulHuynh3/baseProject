//
//  BottomStatusHelperView.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-15.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class BottomStatusHelperView: UIView, NibOwnerLoadable {
    // MARK: - Properties

    let nibName = String(describing: BottomStatusHelperView.self)

    // MARK: - Outlets

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!

    private var leftButtonCallback: (() -> Void)?
    private var rightButtonCallback: (() -> Void)?

    // MARK: - Actions

    @IBAction func leftButtonTapped(_ sender: Any) {
        leftButtonCallback?()
    }

    @IBAction func rightButtonTapped(_ sender: Any) {
        rightButtonCallback?()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNibContent()
    }

    func configure(data: Data) {
        leftButtonCallback = data.leftButtonCallback
        leftButton.setTitle(data.leftButtonText, for: .normal)
        leftButton(isEnabled: data.leftButtonCallback != nil)

        rightButtonCallback = data.rightButtonCallback
        rightButton.setTitle(data.rightButtonText, for: .normal)
        rightButton(isEnabled: data.rightButtonCallback != nil)
    }


    // MARK: - Methods

    func leftButton(isEnabled: Bool) {
        leftButton.isEnabled = isEnabled
        leftButton.isHidden = !isEnabled
    }

    func rightButton(isEnabled: Bool) {
        rightButton.isEnabled = isEnabled
        rightButton.isHidden = !isEnabled
    }

    //need to design the colours too etc

    struct Data {
        var leftButtonCallback: (() -> Void)?
        var rightButtonCallback: (() -> Void)?
        var leftButtonText: String?
        var rightButtonText: String?

        init(
            leftButtonCallback: (() -> Void)? = nil,
            rightButtonCallback: (() -> Void)? = nil,
            leftButtonText: String? = nil,
            rightButtonText: String? = nil
        ) {
            self.leftButtonCallback = leftButtonCallback
            self.rightButtonCallback = rightButtonCallback
            self.leftButtonText = leftButtonText
            self.rightButtonText = rightButtonText
        }
    }

}
