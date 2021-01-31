//
//  ChatLogTableViewCell.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-30.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class ChatLogTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: Data) {
        setup(data: data)
    }

    private func setup(data: Data) {
        userImageView.image = data.user.profileImage
        userImageView.layer.cornerRadius = userImageView.frame.size.height/2
        nameLabel.text = data.user.name
        messageLabel.text = data.user.lastMessage
        dateLabel.text = data.user.lastMessageTimeAgo
    }
    
}

extension ChatLogTableViewCell {
    struct Data {
        let user: UserViewModel
    }
}
