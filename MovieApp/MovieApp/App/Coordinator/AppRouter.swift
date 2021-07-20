import UIKit

class AppRouter {
    
    lazy var networkService: NetworkServiceProtocol = {
        NetworkService()
    }()
    
    lazy var moviesNetworkService: MoviesNetworkClient = {
        MoviesNetworkClient(networkService: networkService)
    }()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        let initialVC = MoviesViewController(presenter: MoviesViewPresenter(moviesNetworkService: moviesNetworkService))
        navigationController.setViewControllers([initialVC], animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
