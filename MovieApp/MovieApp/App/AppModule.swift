import UIKit
import Resolver

class AppModule {

    private let container: Resolver

    init(container: Resolver) {
        self.container = container
        registerAllServices(in: container)
    }

    func startRouter(with window: UIWindow) {
        let appRouter: AppRouter = container.resolve()
        appRouter.setStartScreen(in: window)
    }

    func registerAllServices(in container: Resolver) {
        registerNetworkClient(in: container)
        registerDataSources(in: container)
        registerRepository(in: container)
        registerUseCase(in: container)
        registerAppRouter(in: container)
        registerHomeViewController(in: container)
        registerFavoritesViewController(in: container)
        registerCustomTabBar(in: container)
        registerDetailsViewController(in: container)
        registerSearchViewController(in: container)
    }

    private func registerNetworkClient(in container: Resolver) {
        container
            .register { MoviesNetworkClient() }
            .implements(MoviesNetworkClientProtocol.self)
            .scope(.application)
    }

    private func registerDataSources(in container: Resolver) {
        container
            .register { MoviesNetworkDataSource(networkClient: container.resolve()) }
            .implements(MoviesNetworkDataSourceProtocol.self)
            .scope(.application)

        container
            .register { LocalDataSource() }
            .implements(LocalDataSourceProtocol.self)
            .scope(.application)
    }

    private func registerRepository(in container: Resolver) {
        container
            .register { MoviesRepository(localDataSource: container.resolve(), networkDataSource: container.resolve()) }
            .implements(MoviesRepositoryProtocol.self)
            .scope(.application)

        container
            .register { FavoritesRepository(localDataSource: container.resolve()) }
            .implements(FavoritesRepositoryProtocol.self)
            .scope(.application)
    }

    private func registerUseCase(in container: Resolver) {
        container
            .register { MoviesUseCase(moviesRepository: container.resolve(), favoritesRepository: container.resolve()) }
            .implements(MoviesUseCaseProtocol.self)
            .scope(.application)
    }

    private func registerAppRouter(in container: Resolver) {
        container
            .register { AppRouter(container: container) }
            .scope(.application)
    }

    private func registerHomeViewController(in container: Resolver) {
        container
            .register { HomeViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { HomePresenter(moviesUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)
    }

    private func registerFavoritesViewController(in container: Resolver) {
        container
            .register { FavoriteMoviesViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { FavoriteMoviesPresenter(moviesUseCase: container.resolve()) }
            .scope(.unique)
    }

    private func registerCustomTabBar(in container: Resolver) {
        container
            .register {
                CustomTabBarController(
                homeViewController: container.resolve(),
                favoriteViewController: container.resolve())
            }
            .scope(.unique)
    }

    private func registerDetailsViewController(in container: Resolver) {
        container
            .register { _, args in
                DetailsViewController(presenter: container.resolve(args: args()))
            }
            .scope(.unique)

        container
            .register { _, args in
                DetailsPresenter(movieUseCase: container.resolve(), router: container.resolve(), identifier: args())
            }
            .scope(.unique)
    }

    private func registerSearchViewController(in container: Resolver) {
        container
            .register { MoviesSearchViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { MoviesSearchPresenter(moviesUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)
    }

}
