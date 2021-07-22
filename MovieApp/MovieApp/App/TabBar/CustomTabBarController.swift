import UIKit

class CustomTabBarController: UITabBarController {
    
    var homeNavigationController: UINavigationController!
    var favoriteNavigationController: UINavigationController!
    
    init(
        homeNavigationController: UINavigationController,
        favoriteNavigationController: UINavigationController
    ) {
        self.homeNavigationController = homeNavigationController
        self.favoriteNavigationController = favoriteNavigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        setupChildViewControllers()
    }
    
}
