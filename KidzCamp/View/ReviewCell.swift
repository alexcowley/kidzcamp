//
//  BaseCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/29/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    var reviewModel: ReviewModel? {
        didSet {
            guard let unwrappedPage = reviewModel else {return}
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.reviewsText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            
            reviewTextView.attributedText = attributedText
            reviewTextView.textAlignment = .center
        }
        }
        
        let reviewTextView: UITextView = {
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
        
        private func setupLayout() {
            
            addSubview(reviewTextView)
            
            reviewTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150).isActive = true
            reviewTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            reviewTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            reviewTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            
        }
    
}
