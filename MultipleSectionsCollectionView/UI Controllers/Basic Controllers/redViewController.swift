//
//  RedViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/23/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    //====================
    // MARK: - UI Elements
    //====================
    
    let dismissButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue
        button.setTitle("Dismiss", for: UIControl.State())
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        button.alpha = 0
        button.isEnabled = false
        return button
        
    }()
    
    let hideButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue
        button.setTitle("Hide", for: UIControl.State())
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleHide), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the viewController
        view.backgroundColor = UIColor.red
        view.restorationIdentifier = "album1"
        
        // Add the button to the subview
        view.addSubview(dismissButton)
        view.addSubview(hideButton)
        
        // Setup the buttons
        setupHideButton()
        setupDismissButton()
        
        
    }
    
    // Make sure nothing is caught in a retain cycle
    deinit {
        print("Reclaiming memory")
    }
    
    //================
    // MARK: - Methods
    //================
    
    func setupDismissButton() {
        
        // Add constraints
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    func setupHideButton() {
        
        // Add constraints
        hideButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hideButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        hideButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        hideButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //================
    // MARK: - Actions
    //================
    
    @objc func handleDismiss() {
        
        // Dismiss the viewController
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func handleHide() {
        
        if dismissButton.alpha == 0 {
            
            dismissButton.alpha = 1
            dismissButton.isEnabled = true
            
        } else {
            
            dismissButton.alpha = 0
            dismissButton.isEnabled = false
            
            
        }
        
        
    }
    
}
