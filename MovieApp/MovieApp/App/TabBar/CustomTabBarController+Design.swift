import UIKit

extension CustomTabBarController {
    
    func styleTabBar() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .appBlue
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.appBlack.cgColor
        tabBar.layer.shadowOpacity = 0.05
        
        addChild(homeViewController)
        homeViewController.tabBarItem.image = UIImage(with: .homeLogo)
        homeViewController.tabBarItem.title = BundleTabBar.home
            .rawValue
        
        addChild(favoriteMoviesViewController)
        favoriteMoviesViewController.tabBarItem.image = UIImage(with: .favoriteLogo)
        favoriteMoviesViewController.tabBarItem.title = BundleTabBar.favorites.rawValue
    }
    
}

