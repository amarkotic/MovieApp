import UIKit

class AppRouter {
    
    private let navigationController : UINavigationController!
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        let initialVc = MoviesViewController(presenter: MainViewPresenter(dataService: MovieDataService(), networkService: NetworkService()))
        navigationController.setViewControllers([initialVc], animated: true)
        
        window?.rootViewController =  navigationController
        window?.makeKeyAndVisible()
    }
    
}
