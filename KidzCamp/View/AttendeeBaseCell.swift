//
//  AttendeeBaseCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 8/3/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class AttendeeBaseCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .purple
        return cv
    }()
    
    let cellId = "cellId"
    
    let attendeePages = [
        AttendeeModel(attendeeText: "Discover camps."),
        AttendeeModel(attendeeText: "Connect with parents"),
        AttendeeModel(attendeeText: "Discasdfasfs."),
        AttendeeModel(attendeeText: "Connefasdfasfct with parents"),
        AttendeeModel(attendeeText: "Discgsgsdgover camps."),
        AttendeeModel(attendeeText: "Connehhstehsct with parents")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout()  {
        //        backgroundColor = .red
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        collectionView.register(AttendeeCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attendeePages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AttendeeCell
        
        let attendeePage = attendeePages[indexPath.item]
        cell.attendeeModel = attendeePage
        
        cell.backgroundColor = .gray
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //                if indexPath.section == 0 {
        return CGSize(width: 200, height: 250)
        //                }
        
        //                return CGSize(width: frame.width, height: 550)
    }
    
}
