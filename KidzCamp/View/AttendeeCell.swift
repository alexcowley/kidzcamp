//
//  InfoCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/29/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class AttendeeCell: UICollectionViewCell {
    
    
    var attendeeModel: AttendeeModel? {
        didSet {
            guard let unwrappedPage = attendeeModel else {return}
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.attendeeText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            
            attendeeTextView.attributedText = attributedText
            attendeeTextView.textAlignment = .center
        }
    }
    
    let attendeeTextView: UITextView = {
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
        
        addSubview(attendeeTextView)
        
        attendeeTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150).isActive = true
        attendeeTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        attendeeTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        attendeeTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
    }
}
