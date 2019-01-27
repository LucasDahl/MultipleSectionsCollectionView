//
//  SettingsViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/24/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit
// MARK: - Should be a tableView with a navigation controller
class SettingsViewController: UINavigationController {
    
    let settingsButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Settings", for: UIControl.State())
        button.setTitleColor(UIColor.black, for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAlert), for: .touchUpInside)
        return button
        
    }()
    
    let dismissButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("Dismiss", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the color
        view.backgroundColor = UIColor.white
        //TODO: not showing up
        self.navigationItem.title = "Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(handleDismiss))
        
        // Call the methods
        //setupUIElements()
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    func setupUIElements() {
        
        // Add the button to the subview
        view.addSubview(settingsButton)
        view.addSubview(dismissButton)

        // Constraints
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 60).isActive = true


        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //================
    // MARK: - Actions
    //================
    
    @objc func handleDismiss() {
        
        dismiss(animated: true, completion: nil)
        
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
    
    // Ensure there are no retain cycles
    deinit {
        print("Reclaiming memory")
    }
    
    //==================
    // MARK: - TableView
    //==================
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        <#code#>
//    }
    
}
