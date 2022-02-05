//
//  DismissAnimation.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 06.02.2022.
//

import UIKit.UIViewControllerTransitioning

final class DismissAnimation: NSObject {
  
  // MARK: - Private methods
  private func animator(
    using transitionContext: UIViewControllerContextTransitioning) -> UIViewPropertyAnimator? {
    guard let fromView = transitionContext.view(forKey: .from),
          let fromViewController = transitionContext.viewController(forKey: .from) else {
      return nil
    }
    let initialFrame = transitionContext.initialFrame(for: fromViewController)
    let duration = transitionDuration(using: transitionContext)
    let animator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
      fromView.frame = initialFrame.offsetBy(dx: .zero, dy: initialFrame.height)
    }
    
    animator.addCompletion { _ in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    return animator
  }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension DismissAnimation: UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    animator(using: transitionContext)?.startAnimation()
  }
  
  func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
    animator(using: transitionContext) ?? UIViewPropertyAnimator()
  }
}
