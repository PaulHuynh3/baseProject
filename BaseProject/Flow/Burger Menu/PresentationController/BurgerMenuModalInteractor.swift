//
//  BurgerMenuModalInteractor.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-03.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class BurgerMenuModalInteractor: ModalInteractor {
    func recognizerDidScroll(_ sender: UIPanGestureRecognizer, in view: UIView) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }

        let offset = -sender.translation(in: keyWindow).x
        let progress = min(1, max(offset / view.bounds.width, 0))

        switch sender.state {
        case .began:
            hasStarted = true
        case .changed:
            shouldFinish = progress > 0.5
            update(progress)
        case .failed, .cancelled:
            hasStarted = false
            cancel()
        case .ended:
            hasStarted = false
            shouldFinish ? finish() : cancel()
        default:
            return
        }
    }
}
