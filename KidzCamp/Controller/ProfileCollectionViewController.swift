//
//  ProfileCollectionViewController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

private let sectionOneReuseId = "sectionOne"
private let sectionTwoReuseId = "sectionTwo"
private let headerId = "header"

class ProfileCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let profileImage = [
        ProfileImageModel(profileImageName: "profile")
    ]
    
    let favoritesImage = [
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids"),
        FavoriteCampsModel(campImageNames: "kids")
    ]
    
    var modelArray = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
//        modelArray.append(profileImage)
//        modelArray.append(favoritesImage)
//        print(modelArray)
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        collectionView.backgroundColor = .white
        self.collectionView!.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: sectionOneReuseId)
        self.collectionView!.register(FavoritedCampsCollectionViewCell.self, forCellWithReuseIdentifier: sectionTwoReuseId)
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.isPagingEnabled = true
        
    }

    
    // MARK: UICollectionReusableViewDataSource
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //define header
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! HeaderCollectionReusableView
        
//        header.awakeFromNib()
        
//        header.profileImageView.image = UIImage(named: "profile")
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 320)
    }
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return profileImage.count
//        }
            return favoritesImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        // Configure the cell
//        if indexPath.section == 0 {
//            let sectionOneCell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionOneReuseIdentifier, for: indexPath) as! ProfileCollectionViewCell
//            let profile = profileImage[indexPath.item]
//            sectionOneCell.profileModel = profile
//            sectionOneCell.backgroundColor = .blue
            
//            return sectionOneCell
        
//        } else if indexPath.section == 1 {
            let sectionTwoCell = collectionView.dequeueReusableCell(withReuseIdentifier: sectionTwoReuseId, for: indexPath) as! FavoritedCampsCollectionViewCell
        sectionTwoCell.backgroundColor = .green
            let favorite = favoritesImage[indexPath.item]
            sectionTwoCell.favoritesModel = favorite
            
            return sectionTwoCell
//        }
        
//        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        print("THE CELL WIDTH IS: \(width)")
        return CGSize(width: (width - 30)/3, height: (width - 30)/3)
    }
    
    
    // MARK: UICollectionViewDelegate

   

}
