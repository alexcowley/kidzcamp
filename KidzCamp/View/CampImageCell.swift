//
//  CampImageCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 8/3/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class CampImageCell: UICollectionViewCell {
 
    var campImageModel: CampImageModel? {
        didSet {
            guard let unwrappedPage = campImageModel else {return}
            campImageView.image = UIImage(named: unwrappedPage.imageName)
          
        }
        
    }
    
    private let campImageView: UIImageView = {
        //        var image: UIImage = UIImage(named: "camp")!
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
        
        addSubview(campImageView)
        
        campImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        campImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        campImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        
        
    }
    
}
