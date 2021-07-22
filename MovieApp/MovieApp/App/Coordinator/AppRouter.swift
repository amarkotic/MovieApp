import UIKit

class AppRouter {
    
    private let homeNavigationController: UINavigationController
    private let favoriteNavigationController: UINavigationController
    private let homeViewController: HomeViewController
    private let favoriteMoviesViewController: FavoriteMoviesViewController
    private let tabBarController: CustomTabBarController
    private let appDependencies: AppDependencies
    
    init(homeNavigationController: UINavigationController, favoriteNavigationController: UINavigationController) {
        self.homeNavigationController = homeNavigationController
        self.favoriteNavigationController = favoriteNavigationController
        self.homeViewController = HomeViewController()
        self.favoriteMoviesViewController = FavoriteMoviesViewController()
        self.tabBarController = CustomTabBarController(homeViewController: homeNavigationController,
                                                       favoriteMoviesViewController: favoriteNavigationController)
        self.appDependencies = AppDependencies()
    }
    
    func setStartScreen(in window: UIWindow?) {
        homeNavigationController.setViewControllers([homeViewController], animated: true)
        favoriteNavigationController.setViewControllers([favoriteNavigationController], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    

}
