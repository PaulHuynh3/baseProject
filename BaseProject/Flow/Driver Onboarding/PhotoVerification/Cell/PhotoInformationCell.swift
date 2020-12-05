//
//  PhotoInformationCell.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-11.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class PhotoInformationCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var whatIsThisButton: UIButton!
    @IBOutlet weak var identificationImageview: UIImageView!

    private var whatIsThisCallback: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: Data) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        whatIsThisCallback = data.whatIsThisCallback
    }

    @IBAction func whatIsThisTapped(_ sender: Any) {
        whatIsThisCallback?()
    }

    struct Data {
        let title: String
        let description: String
        let whatIsThisCallback: (() -> Void)?
    }

}

