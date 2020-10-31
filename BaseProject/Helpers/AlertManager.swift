//
//  AlertManager.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-30.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class AlertManager {

    static func show(in viewController: UIViewController?, with data: Data) {
        DispatchQueue.main.async {
            var alertActions: [AlertActionData] = []
            if let actions = data.actions, !actions.isEmpty {
                alertActions.append(contentsOf: actions)
            } else {
                alertActions.append(
                    AlertActionData(
                        title: "Got it",
                        style: .default,
                        isPreferred: false,
                        handler: nil
                    )
                )
            }

            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)

            alertActions.forEach { actionData in
                let alertAction = UIAlertAction(title: actionData.title, style: actionData.style) { _ in
                    actionData.handler?()
                }

                alertController.addAction(alertAction)
                if actionData.isPreferred ?? false {
                    alertController.preferredAction = alertAction
                }
            }

            if let viewController = viewController {
                viewController.present(alertController, animated: true, completion: nil)
            } else {
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            }
        }
    }

}

extension AlertManager {
    struct Data {
        let title: String
        let message: String
        let actions: [AlertActionData]?
    }

    struct AlertActionData {
        let title: String?
        let style: UIAlertAction.Style
        let isPreferred: Bool?
        let handler: (() -> Void)?

        init(title: String?, style: UIAlertAction.Style, isPreferred: Bool?, handler: (() -> Void)?) {
            self.title = title
            self.style = style
            self.isPreferred = isPreferred
            self.handler = handler
        }
    }
}
