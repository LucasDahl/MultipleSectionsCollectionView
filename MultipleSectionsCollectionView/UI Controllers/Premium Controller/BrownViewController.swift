//
//  BrownViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 2/6/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class BrownViewController: UIViewController {
    
    // UI elements
    let dismissButton: UIButton = {
       
        let button = UIButton(type: .system)
        let originalImage = UIImage(named: "home")
        
        // This tints the image
        let tintedImage = originalImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor.black
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.brown
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    func setupDismissButton() {
        
        // Add constraints
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //================
    // MARK: - Actions
    //================
    
    @objc func handleDismiss() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    deinit {
        print("Reclaming memory")
    }
    
}
