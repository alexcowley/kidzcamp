//
//  QuestionCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 6/22/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    var questionModel: QuestionModel? {
        didSet {
            guard let unwrappedPage = questionModel else {return}
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.questionText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            
            questionTextView.attributedText = attributedText
            questionTextView.textAlignment = .center
        }
    }
    
    private let questionTextView: UITextView = {
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
        
        addSubview(questionTextView)
        
        questionTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150).isActive = true
        questionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
         questionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        questionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
