//
//  SecondViewController.swift
//  vc
//
//  Created by Maxim Soloboev on 13.03.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var defaultHeight: CGFloat =  280
    
    func changeHeight(height: CGFloat) {
        preferredContentSize = .init(width: 300, height: height)
    }
    
    lazy var segmentControll: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["280pt", "150pt"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changeSize), for: .valueChanged)
        return segment
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "xmark.circle.fill")
        config.baseForegroundColor = .systemGray2
        config.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
        button.configuration = config
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        changeHeight(height: defaultHeight)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(segmentControll)
        view.addSubview(closeButton)
    }
    
    private func setupLayout() {
        
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            segmentControll.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            segmentControll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: segmentControll.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func changeSize() {
        switch segmentControll.selectedSegmentIndex {
        case 0:
            changeHeight(height: 280)
        case 1:
            changeHeight(height: 150)
        default:
            break
        }
    }
    
    @objc func closeView() {
        self.dismiss(animated: true)
    }
}
