import UIKit

class AppRouter {
    
    private let navigationController: UINavigationController
    private let appDependencies: AppDependencies
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.appDependencies = AppDependencies()
    }
    
    func setStartScreen(in window: UIWindow?) {
        let initialVC = MoviesViewController(presenter: MoviesPresenter(moviesUseCase: appDependencies.moviesUseCase))
        navigationController.setViewControllers([initialVC], animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
