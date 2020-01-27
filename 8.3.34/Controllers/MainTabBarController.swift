//
//  MainTabBarController.swift
//  8.3.34
//
//  Created by Alexey Meleshkevich on 26.01.2020.
//  Copyright © 2020 Alexey Meleshkevich. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTabBar()
        
    }
    
    func setupTabBar() {
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        mainVC.tabBarItem.image = .actions
        
        let resultsVC = UINavigationController(rootViewController: ResultViewController())
        resultsVC.tabBarItem.image = .checkmark
        
        tabBar.barTintColor = UIColor(red: 20.0 / 255.0, green: 78.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        
        mainVC.navigationBar.barTintColor = UIColor(red: 20.0 / 255.0, green: 78.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
        mainVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        resultsVC.navigationBar.barTintColor = UIColor(red: 20.0 / 255.0, green: 78.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
        resultsVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        resultsVC.navigationController?.title = "Results list"
        resultsVC.tabBarItem.title = "Results list"
        
        
        viewControllers = [mainVC, resultsVC]
    }
    
}
 
