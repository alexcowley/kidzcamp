//
//  CampDetailCollectionViewController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/17/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit



class CampDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let facts = "facts"
    private let imageId = "imageId"
    private let factsId = "factsId"
    private let attendeeId = "attendeeId"
    private let reviewId = "reviewId"
    private let cellId = "cell"
    
    let campImagePages = [

    CampImageModel(imageName: "camp")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        setupCollectionView()
        
    }

    func setupCollectionView() {

        let layout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        self.collectionView!.register(CampImageCell.self, forCellWithReuseIdentifier: imageId)
         self.collectionView!.register(ReviewBaseCell.self, forCellWithReuseIdentifier: reviewId)
        self.collectionView!.register(AttendeeBaseCell.self, forCellWithReuseIdentifier: attendeeId)
        self.collectionView!.register(FactsBaseCell.self, forCellWithReuseIdentifier: factsId)

    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {

            return campImagePages.count
        }

            return 3
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            if indexPath.item == 1 {
                let section1Index1Cell = collectionView.dequeueReusableCell(withReuseIdentifier: attendeeId, for: indexPath) as! AttendeeBaseCell
                return section1Index1Cell
            } else if indexPath.item == 2 {
                let section1Index2Cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewId, for: indexPath) as! ReviewBaseCell
                return section1Index2Cell
            } else {
            let section1Index0Cell = collectionView.dequeueReusableCell(withReuseIdentifier: factsId, for: indexPath) as! FactsBaseCell
            return section1Index0Cell
            }
        } else {
            let section0Index0Cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageId, for: indexPath) as! CampImageCell
            let campImagePage = campImagePages[indexPath.item]
            section0Index0Cell.campImageModel = campImagePage
            section0Index0Cell.backgroundColor = .green
            return section0Index0Cell
        }
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.section == 0 {
//            return CGSize(width: 400, height: 250)
//        }
        
            return CGSize(width: view.frame.width, height: 550)
    }


}
