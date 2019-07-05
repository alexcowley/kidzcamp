//
//  SignUpView.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 6/26/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

class SignUpView: UIViewController, UITextViewDelegate {

    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Kidz Camp"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextView: UITextView = {
        var textView = UITextView()
        textView.font = UIFont(name: "verdana", size: 16)
        textView.layer.cornerRadius = 3
        textView.layer.borderWidth = 0.5
        let color = UIColor.lightGray
        textView.layer.borderColor = color.cgColor
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    let usernameTextView: UITextView = {
        var textView = UITextView()
        textView.font = UIFont(name: "verdana", size: 16)
        textView.layer.cornerRadius = 3
        textView.layer.borderWidth = 0.5
        let color = UIColor.lightGray
        textView.layer.borderColor = color.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    let passwordTextView: UITextView = {
        var textView = UITextView()
        textView.font = UIFont(name: "verdana", size: 16)
        textView.layer.cornerRadius = 3
        textView.layer.borderWidth = 0.5
        let color = UIColor.lightGray
        textView.layer.borderColor = color.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    let emailTextView: UITextView = {
        var textView = UITextView()
        textView.font = UIFont(name: "verdana", size: 16)
        textView.layer.cornerRadius = 3
        textView.layer.borderWidth = 0.5
        let color = UIColor.lightGray
        textView.layer.borderColor = color.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        viewSetup()
        textViewDelegates()
        placeholderText()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func textViewDelegates() {
        
        nameTextView.delegate = self
        usernameTextView.delegate = self
        passwordTextView.delegate = self
        emailTextView.delegate = self
    }
    
    func placeholderText() {
        usernameTextView.text = "Username"
        usernameTextView.textColor = .lightGray
        usernameTextView.textAlignment = .left
        
        nameTextView.text = "Name"
        nameTextView.textColor = .lightGray
        nameTextView.textAlignment = .left
        
        passwordTextView.text = "Password"
        passwordTextView.textColor = .lightGray
        passwordTextView.textAlignment = .left
        
        emailTextView.text = "Email"
        emailTextView.textColor = .lightGray
        emailTextView.textAlignment = .left
        
    }
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToOnboardView), for: .touchUpInside)
        return button
    }()
    
    
    @objc func goToOnboardView(sender: UIButton) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nextView = CollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func viewSetup() {
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextView)
        view.addSubview(usernameTextView)
        view.addSubview(passwordTextView)
        view.addSubview(emailTextView)
        view.addSubview(signUpButton)
        
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  

        nameTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        nameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nameTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        usernameTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 8).isActive = true
        usernameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        usernameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        usernameTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextView.topAnchor.constraint(equalTo: usernameTextView.bottomAnchor, constant: 8).isActive = true
        passwordTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailTextView.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 8).isActive = true
        emailTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
            signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    //MARK: UITextViewDelegates
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if nameTextView.text.isEmpty {
            nameTextView.text = "Hola!"
            nameTextView.textColor = .lightGray
        }
        
        if usernameTextView.text.isEmpty {
            usernameTextView.text = "Hello!"
            usernameTextView.textColor = .lightGray
        }
        
        if passwordTextView.text.isEmpty {
            passwordTextView.text = "Goodbye!"
            passwordTextView.textColor = .lightGray
        }
        
        if emailTextView.text.isEmpty {
            emailTextView.text = "Adios!"
            emailTextView.textColor = .lightGray
        }
    }
    
}
