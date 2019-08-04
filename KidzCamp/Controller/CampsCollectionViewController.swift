//
//  CampsCollectionViewController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/5/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class CampsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CampCellDelegate {

    let camps = [
        CampsModel(imageName: "summer-camp", campName: "htewhds"),
        CampsModel(imageName: "summer-camp", campName: "htjjj"),
        CampsModel(imageName: "summer-camp", campName: "grtjj"),
        CampsModel(imageName: "summer-camp", campName: "fjukft"),
        CampsModel(imageName: "summer-camp", campName: "hthshjyj"),
        CampsModel(imageName: "summer-camp", campName: "llktsw"),
        CampsModel(imageName: "summer-camp", campName: "afrhln")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        setupCollectionView()

        // Do any additional setup after loading the view.
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 5
        self.collectionView!.register(CampsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .orange
//        collectionView.isPagingEnabled = true
    }
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return camps.count
    }

    func infoBtnAction(cell: CampsCollectionViewCell) {
        if let cellIndexPath = collectionView?.indexPath(for: cell)?.row {
            let indexPath = IndexPath(item: cellIndexPath, section: 0)
//            collectionView?.reloadItems(at: [indexPath])
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let nextView = CampDetailCollectionViewController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(nextView, animated: true)
            print(camps[indexPath.item].campName)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CampsCollectionViewCell
    
        // Configure the cell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .blue : .green
        let camp = camps[indexPath.item]
        cell.campsModel = camp
//        cell.info = infoBtnAction as? ((UICollectionViewCell) -> Void)
        cell.delegate = self
//        cell.campController = self
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 550)
//        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    

    
    // MARK: UICollectionViewDelegate

    

}


