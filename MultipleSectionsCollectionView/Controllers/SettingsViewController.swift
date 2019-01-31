//
//  SettingsViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/24/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    //===================
    // MARK: - Properties
    //===================
    
    let cellId = "cellId12345"
    let twoDimensionalArray = [
        ["Purchase to Remove adds", "Restore Purchases"],
        ["FeedBack", "Write a Review"],
        ["Message", "Email"],
        ["More Share Options", "More Apps"]
    ]
    
    
    //====================
    // MARK: - UI Elements
    //====================
    
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
        return twoDimensionalArray.count
    }
    
    // Sets the header label
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Create the label
        let label = UILabel()
        label.textColor = UIColor.gray
        label.backgroundColor = UIColor.init(red: 221/255.0, green: 219/255.0, blue: 221/255.0, alpha: 1.0)
        
        // Set the label
        switch section {
            
        case 0:
            label.text = "Purchase"
        case 1:
            label.text = "Help"
        case 2:
            label.text = "Share"
        case 3:
            label.text = "More"
        default:
            label.text = ""
        }
        
        return label
        
    }
    
    // Sets the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return twoDimensionalArray[section].count
        
    }
    
    // Sets the tableView data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO style the cell, may need a custom cell class
        // Setup the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // Setup the image
        let imageName = "image1"
        let image1 = UIImage(named: imageName)
        tableView.rowHeight = 60
        
        // Setup the view container
        let viewContainer = UIView()
        viewContainer.backgroundColor = UIColor.red
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(viewContainer)
        
        // Setup the label
        let labelText = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(labelText)
        labelText.text = twoDimensionalArray[indexPath.section][indexPath.row]
        
        // Setup the imageView
        let imageView = UIImageView(frame: CGRect(x: 20, y: 5, width: 50, height: 50))
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25// Corner radius should be half of the height and width.
        imageView.image = image1
        viewContainer.addSubview(imageView)
        
        // Setup the constraints
        viewContainer.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        viewContainer.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        viewContainer.heightAnchor.constraint(equalTo: cell.heightAnchor).isActive = true
        viewContainer.widthAnchor.constraint(equalTo: cell.widthAnchor).isActive = true
        labelText.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor, constant: 25).isActive = true
        labelText.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        labelText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: labelText.leadingAnchor, constant: -35).isActive = true
        
        return cell
        
    }
    
    //TODO add cells that have actions based on what cell.
    
} // End class
