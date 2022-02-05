//
//  PresentedViewController.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 06.02.2022.
//

import UIKit

final class PresentedViewController: UIViewController {
  
  // MARK: - Private constants
  private let selfView = PresentedView()
  
  // MARK: - Override methods
  override func loadView() {
    view = selfView
  }
}
