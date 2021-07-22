import UIKit

class AppRouter {
    
    private let navigationController: UINavigationController
    private let appDependencies: AppDependencies
    
    private lazy var tabBarController: UITabBarController = {
        let homeViewController = HomeViewController()
        let favoriteMoviesViewController = FavoriteMoviesViewController()
        return CustomTabBarController(
            homeViewController: homeViewController,
            favoriteMoviesViewController: favoriteMoviesViewController)
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.appDependencies = AppDependencies()
    }
    
    func setStartScreen(in window: UIWindow?) {
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

}
