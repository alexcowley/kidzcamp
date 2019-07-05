//
//  ViewController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/23/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//

import UIKit

struct SignUpModel {
    
    let username: String
    let password: String
    let email: String
    let name: String
}

class ViewController: UIViewController {

    let signUp = SignUpModel(username: "asdf", password: "adsa", email: "gfsgr", name: "bthrst")
    
//    let test = SignUpModel(username: <#String#>)
    var text = UITextView()
    /*
    private let nameTextView: UITextView = {
        var textView = UITextView()
        textView.text = "Hello!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let usernameTextView: UITextView = {
        var textView = UITextView()
        textView.text = "Hola!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let passwordTextView: UITextView = {
        var textView = UITextView()
        textView.text = "Goodbye!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let emailTextView: UITextView = {
        var textView = UITextView()
        textView.text = "Adios!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
    
//        viewSetup()
//        let button = UIButton(frame: CGRect(x: view.center.x , y: view.center.y, width: 200, height: 50))
//        button.backgroundColor = .red
//        button.setTitle("Next", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.isUserInteractionEnabled = false
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        self.view.addSubview(button)
        
        print(signUp.name)
//        text.text = signUp.name
//        var textFields = text.text
        
//        let model = signUp
        
//        let signUpField = SignUpView()
        
//        signUpField.signUpModel = model
        
//        SignUpView().signUpModel = textFields
        
    }
    
    @objc func buttonAction(sender: UIButton) {
        print("button pressed")
//        let layout = UICollectionViewFlowLayout.init()
        let layout = UICollectionViewFlowLayout()
        let nextView = CollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    /*
    func viewSetup() {
        
        view.addSubview(nameTextView)
        view.addSubview(usernameTextView)
        view.addSubview(passwordTextView)
        view.addSubview(emailTextView)
        
        
        nameTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        nameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        nameTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        usernameTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        usernameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        usernameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        usernameTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        passwordTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        passwordTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        passwordTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        passwordTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        emailTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        emailTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emailTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emailTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
 */
}

