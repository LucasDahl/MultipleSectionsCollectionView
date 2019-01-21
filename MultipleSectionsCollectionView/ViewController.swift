//
//  ViewController.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/21/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //===================
    // MARK: - Properties
    //===================
    
    let backgrounImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "bg")
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // Setting up the view
    func setupViews() {
        view.addSubview(backgrounImageView)
        
        backgrounImageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}
