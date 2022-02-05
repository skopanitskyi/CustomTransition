//
//  PresentationController.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 05.02.2022.
//

import UIKit.UIPresentationController

class PresentationController: UIPresentationController {
  
  // MARK: - Override variables
  override var frameOfPresentedViewInContainerView: CGRect {
    return containerView?.frame ?? .zero
  }
  
  // MARK: - Override methods
  override func presentationTransitionWillBegin() {
    super.presentationTransitionWillBegin()
    guard let presentedView = presentedView else { return }
    containerView?.addSubview(presentedView)
  }
  
  override func containerViewDidLayoutSubviews() {
    super.containerViewDidLayoutSubviews()
    presentedView?.frame = frameOfPresentedViewInContainerView
  }
}
