//
//  DimmedView.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 05.02.2022.
//

import UIKit

final class DimmedView: UIView {
  
  // MARK: - Override methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureSelf()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureSelf()
  }
  
  // MARK: - Private methods
  private func configureSelf() {
    backgroundColor = .black.withAlphaComponent(0.4)
  }
}
