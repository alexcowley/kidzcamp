//
//  CampsCollectionViewCell.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 7/5/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit


protocol CampCellDelegate {

    func infoBtnAction(cell: CampsCollectionViewCell)

}

class CampsCollectionViewCell: UICollectionViewCell {
    
    var campsModel: CampsModel? {
        didSet {
            guard let unwrappedPage = campsModel else {return}
            campImageView.image = UIImage(named: unwrappedPage.imageName)
            campNameLabel.text = unwrappedPage.campName
        }
    }
    
    private let campImageView: UIImageView = {
//        var image: UIImage = UIImage(named: "camp")!
//        let imageView = UIImageView(image: image)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.backgroundColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let campNameLabel: UILabel = {
        var label = UILabel() 
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    var info: ((UICollectionViewCell) -> Void)?
    var delegate: CampCellDelegate?
    
    lazy var moreInfoBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Info", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(infoBtnPressed), for: .touchUpInside)
        return button
    }()
    
    let dividerLineView: UIView = {
       let view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 15)
        view.backgroundColor = .green
        return view
    }()
    
//    var campController: CampsCollectionViewController?
    
    @objc func infoBtnPressed(/*_ sender: UIButton*/) {
//        campController?.infoBtnAction(cell: self)
        delegate?.infoBtnAction(cell: self)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
//        contentView.backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func setupLayout()  {
        
        addSubview(campImageView)
        addSubview(dividerLineView)
        addSubview(moreInfoBtn)
        
        campImageView.topAnchor.constraint(equalTo: contentView.topAnchor/*, constant: 150*/).isActive = true
        campImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        campImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        campImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        moreInfoBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        moreInfoBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
//        dividerLineView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        dividerLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dividerLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        dividerLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15).isActive = true
        dividerLineView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        campImageView.addSubview(campNameLabel)
//        campImageView.addSubview(moreInfoBtn)
//        campImageView.addSubview(dividerLineView)
        
        campNameLabel.centerXAnchor.constraint(equalTo: campImageView.centerXAnchor).isActive = true
        campNameLabel.centerYAnchor.constraint(equalTo: campImageView.centerYAnchor).isActive = true
//        campNameLabel.heightAnchor.constraint(equalTo: campImageView.heightAnchor, multiplier: 0.5).isActive = true
        
//        moreInfoBtn.trailingAnchor.constraint(equalTo: campImageView.trailingAnchor, constant: -15).isActive = true
//        moreInfoBtn.bottomAnchor.constraint(equalTo: campImageView.bottomAnchor).isActive = true
        
//        dividerLineView.bottomAnchor.constraint(equalTo: campImageView.bottomAnchor, constant: 15).isActive = true
//        dividerLineView.leadingAnchor.constraint(equalTo: campImageView.leadingAnchor).isActive = true
//        dividerLineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        dividerLineView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 5).isActive = true
        
    }
    
}
