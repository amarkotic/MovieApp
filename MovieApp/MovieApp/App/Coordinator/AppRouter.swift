import UIKit

class AppRouter {
    
    private let appDependencies: AppDependencies
    private let navigationController: UINavigationController
    
    private lazy var tabBarController: UITabBarController = {
        let homeViewController = HomeViewController()
        let favoriteViewController = FavoriteMoviesViewController()
        return CustomTabBarController(
            homeViewController: homeViewController,
            favoriteViewController: favoriteViewController)
    }()
    
    init(navigationController: UINavigationController) {
        self.appDependencies = AppDependencies()
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        navigationController.setViewControllers([tabBarController], animated: false)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
