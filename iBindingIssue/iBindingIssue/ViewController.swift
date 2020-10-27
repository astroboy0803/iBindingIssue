//
//  ViewController.swift
//  iBindingIssue
//
//  Created by 黃宇新 on 2020/10/27.
//

import UIKit

class ViewController: UIViewController {
    
    private let delButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Delegate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        return button
    }()
    
    private let dataButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("DataSource", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        return button
    }()
    
    deinit {
        self.delButton.removeTarget(self, action: #selector(self.goDelegate(button:)), for: .touchUpInside)
        self.dataButton.removeTarget(self, action: #selector(self.goDataSource(button:)), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayouts()

        self.delButton.addTarget(self, action: #selector(self.goDelegate(button:)), for: .touchUpInside)
        self.dataButton.addTarget(self, action: #selector(self.goDataSource(button:)), for: .touchUpInside)
    }
    
    private final func setupLayouts() {
        [self.delButton, self.dataButton].forEach({ [aView = self.view] button in
            button.translatesAutoresizingMaskIntoConstraints = false
            aView?.addSubview(button)
        })
        
        NSLayoutConstraint.activate([
            self.delButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -200),
            self.delButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.delButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2),
            self.delButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2),
            
            self.dataButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 200),
            self.dataButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.dataButton.widthAnchor.constraint(equalTo: delButton.widthAnchor),
            self.dataButton.heightAnchor.constraint(equalTo: delButton.heightAnchor),
        ])
    }
    
    @objc
    private final func goDelegate(button: UIButton) {
        let nextVC = DelegateViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    private final func goDataSource(button: UIButton) {
        let nextVC = DataSourceViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

