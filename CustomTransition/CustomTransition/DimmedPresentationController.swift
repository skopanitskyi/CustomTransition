//
//  DimmedPresentationController.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 05.02.2022.
//

import Foundation

final class DimmedPresentationController: PresentationController {
  
  // MARK: - Private constants
  private let dimmedView = DimmedView()
  
  // MARK: - Override methods
  override func containerViewDidLayoutSubviews() {
    super.containerViewDidLayoutSubviews()
    dimmedView.frame = frameOfPresentedViewInContainerView
  }
  
  override func presentationTransitionWillBegin() {
    super.presentationTransitionWillBegin()
    containerView?.insertSubview(dimmedView, at: .zero)
    animateDimmedViewAlpha()
  }
  
  override func presentationTransitionDidEnd(_ completed: Bool) {
    super.presentationTransitionDidEnd(completed)
    
    if !completed {
      dimmedView.removeFromSuperview()
    }
  }
  
  override func dismissalTransitionDidEnd(_ completed: Bool) {
    super.dismissalTransitionDidEnd(completed)
    
    if completed {
      dimmedView.removeFromSuperview()
    }
  }
  
  // MARK: - Private methods
  
  private func animateDimmedViewAlpha() {
    guard let transitionCoordinator = presentedViewController.transitionCoordinator else {
      return
    }
    
    dimmedView.alpha = .zero
    transitionCoordinator.animate { [weak self] _ in
      self?.dimmedView.alpha = 1
    }
  }
}
