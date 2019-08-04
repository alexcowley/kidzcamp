//
//  FactsCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/29/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class FactsCell: UICollectionViewCell {
    
    
    var factsModel: FactsModel? {
        didSet {
            guard let unwrappedPage = factsModel else {return}
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.factsText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            
            factsTextView.attributedText = attributedText
            factsTextView.textAlignment = .center
        }
    }
    
    let factsTextView: UITextView = {
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
        
        addSubview(factsTextView)
        
        factsTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150).isActive = true
        factsTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        factsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        factsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
    }
}
