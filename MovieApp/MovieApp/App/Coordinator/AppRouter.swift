import UIKit

class AppRouter {
    
    lazy var networkService: NetworkServiceProtocol = {
        NetworkService()
    }()
    
    lazy var moviesNetworkClient: MoviesNetworkClientProtocol = {
        MoviesNetworkClient(networkService: networkService)
    }()
    
    lazy var networkDataSource: NetworkDataSourceProtocol = {
        NetworkDataSource(moviesNetworkClient: moviesNetworkClient)
    }()
    
    lazy var repository: RepositoryProtocol = {
        Repository(networkDataSource: networkDataSource)
    }()
    
    lazy var moviesUseCase: MoviesUseCaseProtocol = {
        MoviesUseCase(repository: repository)
    }()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        let initialVC = MoviesViewController(presenter: MoviesViewPresenter(moviesUseCase: moviesUseCase))
        navigationController.setViewControllers([initialVC], animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
