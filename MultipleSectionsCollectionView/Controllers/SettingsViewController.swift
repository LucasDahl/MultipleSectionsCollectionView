//
//  SettingsViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/24/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue
        button.setTitle("Settings", for: UIControl.State())
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleAlert), for: .touchUpInside)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the color
        view.backgroundColor = UIColor.white
        
        // Call the methods
        setupUIElements()
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    func setupUIElements() {
        
        // Add the button to the subview
        view.addSubview(settingsButton)
        
        // Constraints
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //===============
    // MARK: - Alerts
    //===============
    
    @objc func handleAlert() {
        
        // Make the alert
        let alertController = UIAlertController (title: "Do you want to get the most out of this app?", message: "You will need to go to your phones settings and turn on guided access.", preferredStyle: .alert)
        
        // Set the alerts action
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            
            // Make sure the settings url is not nil
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            // Check if the settingsUrl can be opened.
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        
        // Add the action to the alert
        alertController.addAction(settingsAction)
        
        // Make the cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        // Add the cancel action to the the alert controller
        alertController.addAction(cancelAction)
        
        // Present the alert
        present(alertController, animated: true, completion: nil)
        
    }
    
}
