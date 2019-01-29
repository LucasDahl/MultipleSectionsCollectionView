//
//  SettingsViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/24/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let names = ["Amy", "Bill", "Zack", "Steve"]
    let cellId = "cellId12345"
    
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
        
        // Setup the navigation item
        view.backgroundColor = UIColor.white
        navigationItem.title = "Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(handleDismiss))
        
        // Datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.isNavigationBarHidden = false
        
        // Register the cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
 
        
    }
    
    //================
    // MARK: - Actions
    //================
    
    @objc func handleDismiss() {
        
        navigationController?.popToRootViewController(animated: true)
        
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
    
    // Sets the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Sets the header label
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
        
    }
    
    // Sets the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // Sets the tableView data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = self.names[indexPath.row]
        cell.textLabel?.text = name
        return cell
        
    }
    
} // End class
