//
//  FavoritedCampsCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/24/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class FavoritedCampsCollectionViewCell: UICollectionViewCell {
    
    
    
    var favoritesModel: FavoriteCampsModel? {
        didSet {
            guard let unwrappedPage = favoritesModel else {return}
            campImageView.image = UIImage(named: unwrappedPage.campImageNames)
//            for name in unwrappedPage.campImageNames {
//                campImageView.image = UIImage(named: name)
//            }
        }
        
    }
    
    private let campImageView: UIImageView = {
        //        var image: UIImage = UIImage(named: "camp")!
        //        let imageView = UIImageView(image: image)
        let imageView = UIImageView()
//        imageView.backgroundColor = .green
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
//        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
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
        
        addSubview(campImageView)
        
        campImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        campImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        campImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        
        
    }
    
}
