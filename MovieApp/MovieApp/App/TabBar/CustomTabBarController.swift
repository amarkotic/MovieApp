import UIKit

class CustomTabBarController: UITabBarController {

    private let homeViewController: HomeViewController
    private let favoriteViewController: FavoriteMoviesViewController

    init(homeViewController: HomeViewController, favoriteViewController: FavoriteMoviesViewController) {
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
        styleNavigationBar()
    }

    private func setupChildViewControllers() {
        addChild(homeViewController)
        addChild(favoriteViewController)

        homeViewController.tabBarItem.image = UIImage(with: .homeLogo)
        homeViewController.tabBarItem.selectedImage = UIImage(with: .homeLogoSelected)
        homeViewController.tabBarItem.title = LocalizableStrings.tabBarHomeTitle.rawValue

        favoriteViewController.tabBarItem.image = UIImage(with: .favoriteLogo)
        favoriteViewController.tabBarItem.selectedImage = UIImage(with: .favoriteLogoSelected)
        favoriteViewController.tabBarItem.title = LocalizableStrings.favorites.rawValue
    }

    private func styleNavigationBar() {
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView()
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
    }

}
