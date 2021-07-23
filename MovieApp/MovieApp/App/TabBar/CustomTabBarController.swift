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
    
    private func setupChildViewControllers() {
        addChild(homeViewController)
        addChild(favoriteViewController)
        
        homeViewController.tabBarItem.image = UIImage(with: .homeLogo)
        homeViewController.tabBarItem.title = LocalizableStrings.tabBarHomeTitle.rawValue
        
        favoriteViewController.tabBarItem.image = UIImage(with: .favoriteLogo)
        favoriteViewController.tabBarItem.title = LocalizableStrings.tabBarFavoritesTitle.rawValue
    }
    
    
    private func setupNavigationViewController() {
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView()
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
    }
}
