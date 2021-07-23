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
        
        styleNavigationBar()
    }
    
    func setStartScreen(in window: UIWindow?) {
        navigationController.setViewControllers([tabBarController], animated: false)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func styleNavigationBar() {
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .appBlue
    }
    
}
