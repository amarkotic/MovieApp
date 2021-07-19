import UIKit

class AppRouter {
    
    private let navigationController: UINavigationController!
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        let initialVC = MoviesViewController(presenter: MoviesViewPresenter(networkService: NetworkService()))
        navigationController.setViewControllers([initialVC], animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
