//
//  PresentedView.swift
//  CustomTransition
//
//  Created by Сергей Копаницкий on 06.02.2022.
//

import UIKit

final class PresentedView: UIView {
  
  // MARK: - UI elements
  
  private let containerView: UIView = {
    let view = UIView()
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    view.layer.cornerRadius = 15
    view.backgroundColor = .yellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Title Label"
    label.font = .systemFont(ofSize: 15)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let applyButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Apply", for: .normal)
    button.backgroundColor = .systemBlue.withAlphaComponent(0.3)
    button.layer.cornerRadius = 25
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
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
    configureContainerView()
    configureTitleLabel()
    configureApplyButton()
  }
  
  private func configureContainerView() {
    addSubview(containerView)
    addConstraints([containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    containerView.bottomAnchor.constraint(equalTo: bottomAnchor)])
  }
  
  private func configureTitleLabel() {
    containerView.addSubview(titleLabel)
    addConstraints([titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
                    titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                    titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                    titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
  }
  
  private func configureApplyButton() {
    containerView.addSubview(applyButton)
    addConstraints([applyButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                    applyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                    applyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                    applyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
                    applyButton.heightAnchor.constraint(equalToConstant: 50)])
  }
}
