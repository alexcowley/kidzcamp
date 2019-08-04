//
//  HeaderCollectionReusableView.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/25/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    
    /*private*/ let profileImageView: UIImageView = {
        //        var image: UIImage = UIImage(named: "kids")!
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupView() {
        
        addSubview(profileImageView)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
       
    }
}
