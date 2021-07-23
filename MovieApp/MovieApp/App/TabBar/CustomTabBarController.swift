import UIKit

class CustomTabBarController: UITabBarController {
    
    var homeViewController: UIViewController!
    var favoriteViewController: UIViewController!
    
    init(
        homeViewController: UIViewController,
        favoriteViewController: UIViewController
    ) {
        self.homeViewController = homeViewController
        self.favoriteViewController = favoriteViewController
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
