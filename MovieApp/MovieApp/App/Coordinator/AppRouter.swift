import UIKit

class AppRouter {
    
    private let appDependencies: AppDependencies
    
    private lazy var tabBarController: UITabBarController = {
        let homeViewController = HomeViewController()
        let favoriteViewController = FavoriteMoviesViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)
        return CustomTabBarController(
            homeNavigationController: homeNavigationController,
            favoriteNavigationController: favoriteNavigationController)
    }()
    
    init(homeNavigationController: UINavigationController, favoritesNavigationController: UINavigationController) {
        self.appDependencies = AppDependencies()
    }
    
    func setStartScreen(in window: UIWindow?) {
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
}
