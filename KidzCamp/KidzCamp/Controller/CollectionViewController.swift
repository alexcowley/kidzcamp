//
//  CollectionViewController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let testreuseIdentifier = "TestCell"


class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let onboardPages = [
        OnboardModel(imageName: "camp", headerText: "Discover camps."),
        OnboardModel(imageName: "camp", headerText: "Connect with parents"),
        OnboardModel(imageName: "camp", headerText: "Purchase camp supplies"),
        OnboardModel(imageName: "camp", headerText: "fourth"),
        OnboardModel(imageName: "camp", headerText: "fifth")
    ]
    
    private var nextIndex = 0
    private var prevIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.isNavigationBarHidden = true
        setupBottomControls()
        
        // Register cell classes
        setupCollectionView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 5
        collectionView.backgroundColor = .white
//        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
//        collectionView.dataSource = self
//        collectionView.delegate = self
        self.collectionView!.register(OnboardCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView!.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: testreuseIdentifier)

        collectionView.isPagingEnabled = true
        
    }
    
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(prevButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func prevButtonAction(sender: UIButton) {
        print("next button pressed")
        prevIndex = max(pageControl.currentPage - 1, 0) //compares 1st and 2nd parameter and returns the greater of the 2 comparable values
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }

    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = onboardPages.count
        control.currentPageIndicatorTintColor = .blue
        control.pageIndicatorTintColor = .gray
       return control
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func nextButtonAction(sender: UIButton) {
        print("next button pressed")
        nextIndex = min(pageControl.currentPage + 1, onboardPages.count - 1) //compares 1st and 2nd parameter and returns the lesser of the 2 comparable values
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if nextIndex == 4 {
            setupContinueBtn()
        }
    }
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CONTINUE", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToQuestionView), for: .touchUpInside)
        return button
    }()


    @objc func goToQuestionView(sender: UIButton) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nextView = NextCollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
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

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardPages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OnboardCollectionViewCell

            let onboardPage = onboardPages[indexPath.item]
            cell.onboard = onboardPage
 

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
