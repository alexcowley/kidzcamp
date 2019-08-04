//
//  OnboardCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    var onboardModel: OnboardModel? {
        didSet {
            guard let unwrappedPage = onboardModel else {return}
            onboardImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            onboardTextView.attributedText = attributedText
            onboardTextView.textAlignment = .center 
        }
        
    }
    
    private let onboardImageView: UIImageView = {
//        var image: UIImage = UIImage(named: "camp")!
//        let imageView = UIImageView(image: image)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let onboardTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
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
        addSubview(onboardTextView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        onboardTextView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        onboardTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        onboardTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        topImageContainerView.addSubview(onboardImageView)
        
        
        onboardImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        onboardImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        onboardImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
 
        
    }
    
    
    
    
}
