//
//  MessagesViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-30.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyChatStackView: UIStackView!

    let viewModel = MessagesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.mockData()
        setup()
    }

    private func setup() {
        messageState()
        registerNibForTableView(cellType: String(describing: ChatLogTableViewCell.self), tableView: tableView)
    }

    private func messageState() {
        tableView.isHidden = viewModel.userViewModels.count == 0
        emptyChatStackView.isHidden = viewModel.userViewModels.count > 0
    }
}

extension MessagesViewController: TableView {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //navigate to detail cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatLogCell = tableView.dequeueReusableCell(withIdentifier: "ChatLogTableViewCell") as? ChatLogTableViewCell else { fatalError() }
        let userViewModel = viewModel.userViewModels[indexPath.row]
        chatLogCell.configure(data: viewModel.buildChatLogCellData(user: userViewModel))
        return chatLogCell
    }
}
