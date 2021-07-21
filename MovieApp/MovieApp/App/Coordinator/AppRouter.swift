import UIKit

class AppRouter {
    
    private let navigationController: UINavigationController
    private let homeViewController: HomeViewController
    private let favoriteMoviesViewController: FavoriteMoviesViewController
    private let tabBarController: CustomTabBarController
    private let appDependencies: AppDependencies
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.homeViewController = HomeViewController()
        self.favoriteMoviesViewController = FavoriteMoviesViewController()
        self.tabBarController = CustomTabBarController(homeViewController: homeViewController,
                                                       favoriteMoviesViewController: favoriteMoviesViewController)
        self.appDependencies = AppDependencies()
    }
    
    func setStartScreen(in window: UIWindow?) {
       
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    

}
