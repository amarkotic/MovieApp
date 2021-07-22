import UIKit

class CustomTabBarController: UITabBarController {
    
    var homeViewController: UINavigationController
    var favoriteMoviesViewController: UINavigationController
    
    init(homeViewController: UINavigationController, favoriteMoviesViewController: UINavigationController) {
        self.homeViewController = homeViewController
        self.favoriteMoviesViewController = favoriteMoviesViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleTabBar()
    }

}
