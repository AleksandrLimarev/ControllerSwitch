//
//  ViewController.swift
//  ControllerSwitch
//
//  Created by Александр Лимарев on 15.03.2023.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(showPopover(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showPopover(_ sender: UIButton) {
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .popover
        if let popoverPresentationController = popoverVC.popoverPresentationController {
            popoverPresentationController.delegate = self
            popoverPresentationController.sourceView = sender
            popoverPresentationController.sourceRect = sender.bounds
            popoverPresentationController.permittedArrowDirections = .up
        }
        present(popoverVC, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

