//
//  TestCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/25/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupLayout()  {
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .brown
        addSubview(topImageContainerView)
    }
}
