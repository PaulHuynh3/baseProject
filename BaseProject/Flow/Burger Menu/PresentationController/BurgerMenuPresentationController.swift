//
//  BurgerMenuPresentationController.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-02.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class BurgerMenuPresentationController: UIPresentationController {
    // MARK: - Properties

    var dimmingView: UIView

    // MARK: - Methods

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        dimmingView = UIView()
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = .black
        dimmingView.alpha = 0.0
        let recognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap(_:))
        )
        dimmingView.addGestureRecognizer(recognizer)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }

    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width * BurgerMenuViewController.widthRatio, height: parentSize.height)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: .zero, size: size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView?.bounds.size ?? CGSize.zero))
    }

    // MARK: - Presentation Controller methods

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = self.containerView else {
            return
        }
        containerView.insertSubview(dimmingView, belowSubview: presentingViewController.view)
        dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        dimmingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        dimmingView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.5
            return
        }
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.5
        })
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }
}
