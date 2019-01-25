//
//  BlackViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/22/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class BlackViewController: UIViewController {
    
    //====================
    // MARK: - UI Elements
    //====================
    
    let dismissButton: UIButton = {
        
        let button = UIButton(type: .system)
        let originalImage = UIImage(named: "home")
        let tintedImage = originalImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the viewController
        view.backgroundColor = UIColor.black
        view.restorationIdentifier = "album9"
        
        
        // Add the button to the subview
        view.addSubview(dismissButton)
        
        setupDismissButton()
        
        
    }
    
    // Change the color of the statusBar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
    
    //================
    // MARK: - Actions
    //================
    
    @objc func handleDismiss() {
        
        // Dismiss the viewController
        dismiss(animated: true, completion: nil)
        
    }
    
}

