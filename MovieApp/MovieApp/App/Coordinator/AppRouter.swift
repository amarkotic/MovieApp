import UIKit

class AppRouter {

    private let navigationController = UINavigationController()
    private let container: Resolver

    private lazy var tabBarController: UITabBarController = {
        let tabBarController: CustomTabBarController = container.resolve()
        return tabBarController
    }()

    init(container: Resolver) {
        self.container = container
        styleNavigationBar()
    }

    func setStartScreen(in window: UIWindow?) {
        navigationController.setViewControllers([tabBarController], animated: false)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func showMovieDetails(with identifier: Int) {
        let detailsViewController: DetailsViewController = container.resolve(args: identifier)
        navigationController.pushViewController(detailsViewController, animated: true)
    }

    func showHomeScreen() {
        navigationController.popViewController(animated: true)
    }

    func goToSearch() {
        let searchViewController: MoviesSearchViewController = container.resolve()
        navigationController.pushViewController(searchViewController, animated: false)
    }

    func popWithoutAnimation() {
        navigationController.popViewController(animated: false)
    }

    private func styleNavigationBar() {
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .appBlue
    }

}
