//
//  SettingsViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/24/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UITableViewController {
    
    //===================
    // MARK: - Properties
    //===================
    
    let cellId = "cellId12345"
    let twoDimensionalArray = [
        ["Purchase to Remove adds", "Restore Purchases"],
        ["FeedBack", "Write a Review"],
        ["Message", "Email"],
        ["More Share Options", "How to get the most out of this app!"]
    ]
    
    
    //====================
    // MARK: - UI Elements
    //====================
    
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
        
        // Return the number of sections based on the 2D array
        return twoDimensionalArray[section].count
        
    }
    
    // Sets the tableView data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Setup the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // Setup the view container
        let viewContainer = UIView()
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Setup the label
        let labelText = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.text = twoDimensionalArray[indexPath.section][indexPath.row]
        
        // Setup the imageView
        let imageView = UIImageView(frame: CGRect(x: 20, y: 5, width: 25, height: 25))
        
        // Add elements to the subviews
        cell.addSubview(viewContainer)
        viewContainer.addSubview(imageView)
        viewContainer.addSubview(labelText)
        
        
        // Cell methods for cell setup
        setupConstraints(tableCell: cell, container: viewContainer, text: labelText, image: imageView)
        setupCellImage(image: imageView, indexPath: indexPath)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO: add the action for each cell need a method with a switch statment.
        switch indexPath.section {
            
        case 0:
            switch indexPath.row {
            case 0 :
                print("0")
            case 1:
                print("1")
            default:
                print("d")
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                handleEmailSend(recipient: "me@gmail.com", messageBody: "Hello")// Must be ran on an actual device
            case 1:
                print("11")
            default:
                print("dd")
                
            }
        case 2:
            switch indexPath.row {
            case 0:
                print("000")
            case 1:
                print("111")
            default:
                print("ddd")
                
            }
        case 3:
            switch indexPath.row {
            case 0:
                print("0000")
            case 1:
                handleAlert()
            default:
                print("dddd")
                
            }
        default:
            print("md")
        }
        
    }
    
    //================
    // MARK: - Methods
    //================
    
    // Constraints
    func setupConstraints(tableCell: UITableViewCell, container: UIView, text: UILabel, image: UIImageView) {
        
        // Setup all the constraints for the cell
        container.centerXAnchor.constraint(equalTo: tableCell.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: tableCell.centerYAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: tableCell.heightAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: tableCell.widthAnchor).isActive = true
        text.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 25).isActive = true
        text.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        text.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.centerXAnchor.constraint(equalTo: text.leadingAnchor, constant: -35).isActive = true
        
    }
    
    // Setup the Image
    func setupCellImage(image: UIImageView, indexPath: IndexPath) {
        
        switch indexPath.section {
            
        case 0:
            switch indexPath.row {
            case 0 :
                image.image = UIImage(named: "dollar")
            case 1:
                image.image = UIImage(named: "restore")
            default:
                image.image = UIImage(named: "noImage")
                image.alpha = 0
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                image.image = UIImage(named: "feedback")
            case 1:
                image.image = UIImage(named: "review")
            default:
                image.image = UIImage(named: "image1")
                image.alpha = 0
                
            }
        case 2:
            switch indexPath.row {
            case 0:
                image.image = UIImage(named: "message")
            case 1:
                image.image = UIImage(named: "mail")
            default:
                image.image = UIImage(named: "noImage")
                image.alpha = 0
                
            }
        case 3:
            switch indexPath.row {
            case 0:
                image.image = UIImage(named: "moreActions")
            case 1:
                image.image = UIImage(named: "moreApps")
            default:
                image.image = UIImage(named: "noImage")
                image.alpha = 0
                
            }
        default:
            image.image = UIImage(named: "noImage")
            image.alpha = 0
        }
        
    }
    
    func handleEmailSend(recipient: String, messageBody: String) {
        
        guard MFMailComposeViewController.canSendMail() else {
            
            //TODO: Add alert to show the user the mail didn't send
            return
            
        }
        
        // Setup the composer controller
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients([recipient])
        composer.setSubject(messageBody)
        composer.setMessageBody("I love swift", isHTML: false)
        
        // Present the mail composer
        present(composer, animated: true)
        
    }
    
} // End class


extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    // Allow the user to dismiss the mail composer
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        if let _ = error {
            // Show error
            controller.dismiss(animated: true)

            switch result {
            case .cancelled:
                print("Cancelled")
            case .failed:
                print("Failed to send")
            case .saved:
                print("Saved")
            case .sent:
                print("Email Sent")
            }

        }

        controller.dismiss(animated: true)

    }
    
}
