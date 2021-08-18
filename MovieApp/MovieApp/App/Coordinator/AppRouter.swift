import UIKit

class AppRouter {
    
    private let appDependencies: AppDependencies
    private let navigationController: UINavigationController
    
    private lazy var tabBarController: UITabBarController = {
        let homeViewController = HomeViewController(
            presenter: HomePresenter(moviesUseCase: appDependencies.moviesUseCase, router: self))
        let favoriteViewController = FavoriteMoviesViewController(presenter: FavoriteMoviesPresenter(moviesUseCase: appDependencies.moviesUseCase))
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
    
    func showMovieDetails(with identifier: Int) {
        navigationController.pushViewController(
            DetailsViewController(
                presenter: DetailsPresenter(
                    movieUseCase: appDependencies.moviesUseCase,
                    router: self,
                    identifier: identifier)
            ), animated: true
        )
    }
    
    func showHomeScreen() {
        navigationController.popViewController(animated: true)
    }
    
    func goToSearch() {
        let searchViewController = MoviesSearchViewController(
            presenter: MoviesSearchPresenter(moviesUseCase: appDependencies.moviesUseCase, appRouter: self))
        navigationController.pushViewController(searchViewController, animated: false)
    }
    
    func popWithoutAnimation() {
        navigationController.popViewController(animated: false)
    }
    
    private func styleNavigationBar() {
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .appBlue
    }
    
}
