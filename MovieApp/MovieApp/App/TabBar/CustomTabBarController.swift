import UIKit

class CustomTabBarController: UITabBarController {
    
    var homeViewController: HomeViewController!
    var favoriteMoviesViewController: FavoriteMoviesViewController!
    
    init(
        homeViewController: HomeViewController,
        favoriteMoviesViewController: FavoriteMoviesViewController
    ) {
        self.homeViewController = homeViewController
        self.favoriteMoviesViewController = favoriteMoviesViewController
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
    
    private func setupChildViewControllers() {
        addChild(homeViewController)
        addChild(favoriteMoviesViewController)
        
        homeViewController.tabBarItem.image = UIImage(with: .homeLogo)
        homeViewController.tabBarItem.title = LocalizableStrings.tabBarHomeTitle.rawValue
        
        favoriteMoviesViewController.tabBarItem.image = UIImage(with: .favoriteLogo)
        favoriteMoviesViewController.tabBarItem.title = LocalizableStrings.tabBarFavoritesTitle.rawValue
    }
    
}
