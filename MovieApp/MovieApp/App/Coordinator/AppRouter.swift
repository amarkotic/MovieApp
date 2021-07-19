import UIKit

class AppRouter {
    
    lazy var networkService: NetworkServiceProtocol = {
        NetworkService()
    }()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        let initialVC = MoviesViewController(presenter: MoviesViewPresenter(networkService: networkService))
        navigationController.setViewControllers([initialVC], animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
