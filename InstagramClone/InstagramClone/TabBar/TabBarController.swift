//
//  TabBarViewController.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class TabBarController: UITabBarController {

    private let homeVC = HomeViewController()
    private let searchVC = SearchViewController()
    private let reelsVC = ReelsViewController()
    private let shopVC = ShopViewController()
    private let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createController(imageName: "home", tabVC: homeVC),
                           createController(imageName: "search", tabVC: searchVC),
                           createController(imageName: "reels", tabVC: reelsVC),
                           createController(imageName: "shop", tabVC: shopVC),
                           createController(imageName: "profile", tabVC: profileVC)]
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 90
        tabBar.frame.origin.y = view.frame.height - 90
    }

    private func createController(imageName: String, tabVC: UIViewController) -> UINavigationController {
        let recentVC = UINavigationController(rootViewController: tabVC)

        switch imageName {
        case "home":
            recentVC.tabBarItem.image = UIImage(systemName: "house")
            recentVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        case "search":
            let config = UIImage.SymbolConfiguration(weight: .bold)
            recentVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
            recentVC.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        case "reels":
            recentVC.tabBarItem.image = UIImage(systemName: "video")
            recentVC.tabBarItem.selectedImage = UIImage(systemName: "video.fill")
        case "shop":
            recentVC.tabBarItem.image = UIImage(systemName: "bag")
            recentVC.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        case "profile":
            recentVC.tabBarItem.image = UIImage(systemName: "person")
            recentVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        default:
            break
        }

        return recentVC
    }

}
