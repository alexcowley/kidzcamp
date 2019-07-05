//
//  CustomeTabBarController.swift
//  KidzCamp
//
//  Created by Alex Cowley  on 5/28/19.
//  Copyright © 2019 Alex Cowley . All rights reserved.
//
/*
import UIKit

class CustomTabBarController: UITabBarController {}


override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
//    if isLoggedIn() {
                    let firstController = ViewController()
//        let firstLayout = UICollectionViewFlowLayout.init()
//        let homeVC = ViewController(collectionViewLayout: firstLayout)
        let navigationController = UINavigationController(rootViewController: firstController)
        navigationController.title = "Home"
//        navigationController.tabBarItem.image = UIImage(named: "School Icon")
    
//        let secondController = NewsTableViewController()
//        let secondNavigationController = UINavigationController(rootViewController: secondController)
//        secondNavigationController.title = "Notifications"
//        secondNavigationController.tabBarItem.image = UIImage(named: "Notification Icon")
//        secondController.cached = cached
    
        //            let thirdController = homeVC()
        let secondLayout = UICollectionViewFlowLayout.init()
        let collectionVC = CollectionViewController(collectionViewLayout: secondLayout)
        let thirdNavigationController = UINavigationController(rootViewController: collectionVC)
        thirdNavigationController.title = "Onboard"
        thirdNavigationController.tabBarItem.image = UIImage(named: "Student Icon")
        //            profileCollectionVC.cached = cached
        
        let fourthLayout = UICollectionViewFlowLayout.init()
        let feedCollectionVC = CollegeActivityFeedCollectionVC(collectionViewLayout: fourthLayout)
        let fourthNavigationController = UINavigationController(rootViewController: feedCollectionVC)
        fourthNavigationController.title = "Feed"
        fourthNavigationController.tabBarItem.image = UIImage(named: "Feed Icon New")
        
        if gradeLevel == "Freshman" || gradeLevel == "Sophomore" || gradeLevel == "Junior" || gradeLevel == "Senior" {
            let fifthController = RoadmapContentTableViewController()
            fifthNavigationController = UINavigationController(rootViewController: fifthController)
            fifthNavigationController.title = "Roadmap"
            fifthNavigationController.tabBarItem.image = UIImage(named: "roadmap icon")
            fifthController.gradeLevel = gradeLevel
        } else {
            let fifthController = RoadmapViewController()
            fifthNavigationController = UINavigationController(rootViewController: fifthController)
            fifthNavigationController.title = "Roadmap"
            fifthNavigationController.tabBarItem.image = UIImage(named: "roadmap icon")
        }
        
        
        
        viewControllers = [navigationController, fourthNavigationController, secondNavigationController, thirdNavigationController, fifthNavigationController]
        
        
        
//    } else {
//
//        perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
//        print("Button pressed")
//    }
}

//private func isLoggedIn() -> Bool {
//
//    return UserDefaults.standard.bool(forKey: "isLoggedIn")
//
//}
/*
@objc func showLoginController() {
    
    //never impliment
    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    //        let vc : ViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreen") as! ViewController
    
    //neha
    let vc : SignInUpVC = storyboard.instantiateViewController(withIdentifier: "SignInUpVC") as! SignInUpVC
    //neha
    
    let navigationController = UINavigationController(rootViewController: vc)
    view.backgroundColor = .white
    
    self.present(navigationController, animated: true, completion: nil)
    
}
*/

}

*/
