//
//  DriverRequirementCell.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-04.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class DriverRequirementCell: UITableViewCell {

    @IBOutlet weak var taskImageview: UIImageView!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var documentSubLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: Data) {
        documentLabel.text = data.documentName
        documentSubLabel.text = data.isCompleted ? "Done" : "Get Started"
        taskImageview.image = data.isCompleted ? UIImage(named: "checkMark") : UIImage(named: "document")
    }
    
}

extension DriverRequirementCell {
    struct Data {
        let documentName: String
        let isCompleted: Bool
    }
}
