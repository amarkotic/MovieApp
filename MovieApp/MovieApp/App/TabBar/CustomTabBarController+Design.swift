import UIKit

extension CustomTabBarController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
    }
    
    func styleViews() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .appBlue
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.appBlack.cgColor
        tabBar.layer.shadowOpacity = 0.05
    }
    
    func defineLayoutForViews() {
    }
    
    func setupChildViewControllers() {
        addChild(homeNavigationController)
        addChild(favoriteNavigationController)
        
        homeNavigationController.tabBarItem.image = UIImage(with: .homeLogo)
        homeNavigationController.tabBarItem.title = LocalizableStrings.tabBarHomeTitle.rawValue
        
        favoriteNavigationController.tabBarItem.image = UIImage(with: .favoriteLogo)
        favoriteNavigationController.tabBarItem.title = LocalizableStrings.tabBarFavoritesTitle.rawValue
    }
    
}

