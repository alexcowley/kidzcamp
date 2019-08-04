//
//  NextCollectionViewController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class NextCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let questions = [
        QuestionModel(questionText: "asfdadf", headerText: "gfsfgrg"),
        QuestionModel(questionText: "sgnirngn", headerText: "gfsfgrg"),
        QuestionModel(questionText: "nefgrys", headerText: "gfsfgrg")
    
    ]
    
    private var nextIndex = 0
    private var prevIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBottomControls()
        setupContinueBtn()
        
        // Register cell classes
        setupCollectionView()
        
        // Do any additional setup after loading the view.
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 5
        self.collectionView!.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
    }


    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = questions.count
        control.currentPageIndicatorTintColor = .blue
        control.pageIndicatorTintColor = .gray
        return control
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CONTINUE", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [pageControl])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func setupContinueBtn() {
        
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func nextButtonAction(sender: UIButton) {
        print("next button pressed")
        nextIndex = min(pageControl.currentPage + 1, questions.count - 1) //compares 1st and 2nd parameter and returns the lesser of the 2 comparable values
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if nextIndex == 2 {
            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
            let nextView = CampsCollectionViewController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(nextView, animated: true)
        }

    }
    
   
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return questions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! QuestionCollectionViewCell
    
        // Configure the cell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .black : .brown
        
        let question = questions[indexPath.item]
        cell.questionModel = question
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: UICollectionViewDelegate


}
