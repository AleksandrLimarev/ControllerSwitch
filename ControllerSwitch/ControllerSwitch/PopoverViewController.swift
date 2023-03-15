//
//  PopoverViewController.swift
//  ControllerSwitch
//
//  Created by Александр Лимарев on 15.03.2023.
//

import UIKit
class PopoverViewController: UIViewController {
    
    let containerView = UIView()
    let switchControl = UISegmentedControl(items: ["280pt", "150pt"])
    var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        heightConstraint = containerView.heightAnchor.constraint(equalToConstant: 280)
        heightConstraint.isActive = true
        
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.selectedSegmentIndex = 0
        switchControl.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        containerView.addSubview(switchControl)
        NSLayoutConstraint.activate([
            switchControl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            switchControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func switchChanged(_ sender: UISegmentedControl) {
        heightConstraint.constant = sender.selectedSegmentIndex == 0 ? 280 : 150
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
