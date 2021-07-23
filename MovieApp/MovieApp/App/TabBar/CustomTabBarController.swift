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
        setupNavigationViewController()
    }
    
    func setupNavigationViewController() {
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView()
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
    }
}
