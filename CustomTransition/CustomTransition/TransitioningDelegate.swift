//
//  TransitioningDelegate.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 05.02.2022.
//

import UIKit.UIViewControllerTransitioning

final class TransitioningDelegate: NSObject {
  
}

// MARK: - UIViewControllerTransitioningDelegate
extension TransitioningDelegate: UIViewControllerTransitioningDelegate {
  
  func animationController(
    forPresented presented: UIViewController,
    presenting: UIViewController,
    source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentAnimation()
  }
  
  func animationController(
    forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return DismissAnimation()
  }
  
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return DimmedPresentationController(presentedViewController: presented, presenting: presenting ?? source)
  }
}
