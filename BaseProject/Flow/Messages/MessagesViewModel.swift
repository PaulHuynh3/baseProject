//
//  MessagesViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-30.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import Foundation

class MessagesViewModel {
    var userViewModels = [UserViewModel]()

    func configure(data: Data) {
        userViewModels = data.userMessages
    }

    func mockData() {
        let data: UserViewModel = UserViewModel(name: "David Zhang", status: "", lastMessage: "What the fuck man", profileImage: #imageLiteral(resourceName: "devil"), lastMessageTimeAgo: "10 mins ago")
        userViewModels.append(data)
    }

    func buildChatLogCellData(user: UserViewModel) -> ChatLogTableViewCell.Data {
        return ChatLogTableViewCell.Data(user: user)
    }

}

extension MessagesViewModel {
    struct Data {
        let userMessages: [UserViewModel]
    }
}

