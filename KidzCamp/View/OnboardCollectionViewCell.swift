//
//  OnboardCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    var onboard: OnboardModel? {
        didSet {
            guard let unwrappedPage = onboard else {return}
            onboardImageView.image = UIImage(named: unwrappedPage.imageName)
        }
        
    }
    
    private let onboardImageView: UIImageView = {
        var image: UIImage = UIImage(named: "camp")!
        let imageView = UIImageView(image: image)
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
        
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(onboardImageView)
        onboardImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        onboardImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        onboardImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
 
        
    }
    
    
    
    
}
