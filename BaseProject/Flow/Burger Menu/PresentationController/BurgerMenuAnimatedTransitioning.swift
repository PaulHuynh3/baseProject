//
//  BurgerMenuAnimatedTransitioning.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-10-02.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class BurgerMenuAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Properties

    var isPresenting: Bool = true
    var interactor: ModalInteractor?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return BurgerMenuViewController.animationDuration
    }

    // MARK: - Methods

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let controller = transitionContext.viewController(forKey: isPresenting ? .to : .from)
        else { return }
        if isPresenting {
            transitionContext.containerView.addSubview(controller.view)
        }
        let presentedFrame = transitionContext.finalFrame(for: controller)
        var dismissedFrame = presentedFrame
        dismissedFrame.origin.x = -presentedFrame.width
        controller.view.frame = isPresenting ? dismissedFrame : presentedFrame

        UIView.animate(
            withDuration: BurgerMenuViewController.animationDuration,
            animations: {
                controller.view.frame = self.isPresenting ? presentedFrame : dismissedFrame
            }, completion: { finished in
                if self.isPresenting {
                    transitionContext.completeTransition(finished)
                } else if finished && !transitionContext.transitionWasCancelled {
                    controller.view.removeFromSuperview()
                    transitionContext.completeTransition(true)
                } else {
                    transitionContext.completeTransition(false)
                }
            }
        )
    }
}
