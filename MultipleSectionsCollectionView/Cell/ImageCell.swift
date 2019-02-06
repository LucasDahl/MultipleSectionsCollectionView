//
//  ImageCell.swift
//  MultipleSectionsCollectionView
//
//  Created by Lucas Dahl on 1/23/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // Properties
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        
        // Setup the layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        // Setup the collectionView by adding the layout
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        // Add the collectionView to the subview
        addSubview(collectionView)
        
        // Set the anchors
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        // Set the datasource and datasource
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register the cell
        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    //========================
    // MARK: - CollectionViews
    //========================
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Setup the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconsCell
        if let imagName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imagName)
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // To switch between controllers that ideal would need to be paid for
        switch indexPath.row {
            
        case 0:
            print(0)
        case 1:
            print(1)
        case 2:
            print(2)
        case 3:
            print(3)
        case 4:
            print(4)
        default:
            print("Fell through")
            return
        }
        
    }
    
    private class IconsCell: UICollectionViewCell {
        
        let imageView: UIImageView = {
            
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 15
            return iv
            
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Methods
        func setup() {
            
            setCellShadow()
            addSubview(imageView)
            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            
        }
        
        
    }
    
}
