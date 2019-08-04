//  ProfileCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    var profileModel: ProfileImageModel? {
        didSet {
            guard let unwrappedPage = profileModel else {return}
            profileImageView.image = UIImage(named: unwrappedPage.profileImageName)
        }
        
    }
    
    private let profileImageView: UIImageView = {
//        var image: UIImage = UIImage(named: "kids")!
//        let imageView = UIImageView(image: image)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout()  {
        
        addSubview(profileImageView)
        
        profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        
        
    }
}
