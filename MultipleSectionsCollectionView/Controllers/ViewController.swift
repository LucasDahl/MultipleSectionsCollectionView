//
//  ViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/21/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //===================
    // MARK: - Properties
    //===================
    
    let imagesCellId = "imagesCellId"
    let albumsCellId = "albumsCellId"
    let imagesArray = ["image1", "image2", "image3", "image4", "image5"]
    let albumsArray = ["album1", "album2", "album3", "album4", "album5", "album6", "album7", "album8", "album9"]
    
    let collectionView: UICollectionView = {
        
        //Setup th elayout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        // Add the layout to the viewController
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
        
    }()
    
    let backgrounImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "bg")
        return iv
        
    }()
    
    let settingsButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
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
        setupViews()
    }
    
    
    // Setting up the view
    func setupViews() {
        
        // Set the delegate and datasource
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register the cell
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: imagesCellId)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: albumsCellId)
        
        // Add the subviews
        view.addSubview(backgrounImageView)
        view.addSubview(collectionView)
        view.addSubview(settingsButton)
        
        // Set the anchors
        backgrounImageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        // Setup the stackView
        let stackView = UIStackView(arrangedSubviews: [settingsButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        // This is needed to allow auto-layout constraints through code usable
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stackview to the subview
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
    }
    
    //=======================
    // MARK: - CollectionView
    //=======================
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1 {
            return albumsArray.count
        }
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Used of there is one section
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! AlbumCell
            cell.album = albumsArray[indexPath.item]
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId, for: indexPath) as! ImageCell
        cell.images = imagesArray
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        
        return CGSize(width: view.frame.width, height: 300)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // A switch case will help each viewController deinit to avoide retain cycles.
        switch indexPath.row {
            
        case 0:
            present(RedViewController(), animated: true, completion: nil)
        case 1:
            present(OrangeViewController(), animated: true, completion: nil)
        case 2:
            present(YellowViewController(), animated: true, completion: nil)
        case 3:
            present(GreenViewController(), animated: true, completion: nil)
        case 4:
            present(BlueViewController(), animated: true, completion: nil)
        case 5:
            present(PurpleViewController(), animated: true, completion: nil)
        case 6:
            present(LightGrayViewController(), animated: true, completion: nil)
        case 7:
            present(GrayViewController(), animated: true, completion: nil)
        case 8:
            present(BlackViewController(), animated: true, completion: nil)
        default:
            return
            
        }
        
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
    
}// End class

