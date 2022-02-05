//
//  PresentAnimation.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 05.02.2022.
//

import UIKit.UIViewControllerTransitioning

final class PresentAnimation: NSObject {
  
  private func animator(
    using transitionContext: UIViewControllerContextTransitioning) -> UIViewPropertyAnimator? {
    guard let toView = transitionContext.view(forKey: .to),
          let toViewController = transitionContext.viewController(forKey: .to) else {
      return nil
    }
    
    let finalFrame = transitionContext.finalFrame(for: toViewController)
    let duration = transitionDuration(using: transitionContext)
    
    toView.frame = finalFrame.offsetBy(dx: .zero, dy: finalFrame.height)
    
    let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
      toView.frame = finalFrame
    }
    
    animator.addCompletion { _ in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
    return animator
  }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension PresentAnimation: UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    animator(using: transitionContext)?.startAnimation()
  }
  
  func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
    return animator(using: transitionContext) ?? UIViewPropertyAnimator()
  }
}
