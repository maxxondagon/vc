//
//  ViewController.swift
//  vc
//
//  Created by Maxim Soloboev on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.title = "Present"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 22)
        config.titleAlignment = .center
        button.configuration = config
        button.addTarget(self, action: #selector(showPopover), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(button)
    }
    
    private func setupLayout() {
        
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func showPopover() {
        let popoverController = SecondViewController()
        popoverController.modalPresentationStyle = .popover
        
        guard let popover = popoverController.popoverPresentationController else { fatalError("wtf") }
        popover.sourceView = button
        popover.sourceRect = CGRect(x: button.bounds.midX,
                                    y: button.bounds.maxY,
                                    width: 0,
                                    height: 0)
        popover.permittedArrowDirections = .up
        popover.delegate = self
        
        present(popoverController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
