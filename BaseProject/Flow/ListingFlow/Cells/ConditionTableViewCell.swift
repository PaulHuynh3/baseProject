//
//  ConditionTableViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class ConditionTableViewCell: UITableViewCell {

    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var usedNewButton: UIButton!
    @IBOutlet weak var usedGoodButton: UIButton!
    @IBOutlet weak var usedFairButton: UIButton!

    private var conditionCallback: ((Condition) -> Void)?
    private var condition: Condition?

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func configure(data: Data) {
        conditionCallback = data.selectedConditionCallback
        self.condition = data.condition
        state()
    }

    private func setup() {
        newButton.alignImageRightEdge()
        usedNewButton.alignImageRightEdge()
        usedGoodButton.alignImageRightEdge()
        usedFairButton.alignImageRightEdge()
    }

    private func state() {
        guard let productCondition = condition else {
            let unselectedImage = #imageLiteral(resourceName: "radioUnselected")
            newButton.setImage(unselectedImage, for: .normal)
            usedNewButton.setImage(unselectedImage, for: .normal)
            usedGoodButton.setImage(unselectedImage, for: .normal)
            usedFairButton.setImage(unselectedImage, for: .normal)
            return
        }
        let selectedImage = #imageLiteral(resourceName: "radioSelected")
        switch productCondition {
        case .new:
            newButton.setImage(selectedImage, for: .normal)
        case .usedLikeNew:
            usedNewButton.setImage(selectedImage, for: .normal)
        case .usedGood:
            usedGoodButton.setImage(selectedImage, for: .normal)
        case .usedFair:
            usedFairButton.setImage(selectedImage, for: .normal)
        }
    }


    @IBAction func newButtonTapped(_ sender: Any) {
        newButton.setImage(#imageLiteral(resourceName: "radioSelected"), for: .normal)
        conditionCallback?(.new)
    }

    @IBAction func usedNewButtonTapped(_ sender: Any) {
        usedNewButton.setImage(#imageLiteral(resourceName: "radioSelected"), for: .normal)
        conditionCallback?(.usedLikeNew)
    }

    @IBAction func usedGoodButtonTapped(_ sender: Any) {
        usedGoodButton.setImage(#imageLiteral(resourceName: "radioSelected"), for: .normal)
        conditionCallback?(.usedGood)
    }

    @IBAction func usedFairButtonTapped(_ sender: Any) {
        usedFairButton.setImage(#imageLiteral(resourceName: "radioSelected"), for: .normal)
        conditionCallback?(.usedFair)
    }
}

extension ConditionTableViewCell {
    struct Data {
        var condition: Condition?
        var selectedConditionCallback: ((Condition) -> Void)?
    }
}
