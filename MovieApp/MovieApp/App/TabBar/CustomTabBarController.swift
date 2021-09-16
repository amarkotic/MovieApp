import UIKit
import Resolver

class CustomTabBarController: UITabBarController {

    @Injected private var homeViewController: HomeViewController
    @Injected private var favoriteViewController: FavoriteMoviesViewController

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
