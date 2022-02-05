//
//  ViewController.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 05.02.2022.
//

import UIKit

final class ViewController: UIViewController {
  
  // MARK: - Private constants
  private let customTransitionDelegate = TransitioningDelegate()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red.withAlphaComponent(0.5)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      let vc = PresentedViewController()
      vc.modalPresentationStyle = .custom
      vc.transitioningDelegate = self.customTransitionDelegate
      self.present(vc, animated: true, completion: nil)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
      self.dismiss(animated: true, completion: nil)
    }
  }
}

