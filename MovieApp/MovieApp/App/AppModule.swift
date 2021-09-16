import UIKit
import Resolver

class AppModule {

    private let container: Resolver!

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
            .register { MoviesNetworkDataSource() }
            .implements(MoviesNetworkDataSourceProtocol.self)
            .scope(.application)

        container
            .register { LocalDataSource() }
            .implements(LocalDataSourceProtocol.self)
            .scope(.application)
    }

    private func registerRepository(in container: Resolver) {
        container
            .register { MoviesRepository() }
            .implements(MoviesRepositoryProtocol.self)
            .scope(.application)

        container
            .register { FavoritesRepository() }
            .implements(FavoritesRepositoryProtocol.self)
            .scope(.application)
    }

    private func registerUseCase(in container: Resolver) {
        container
            .register { MoviesUseCase() }
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
            .register { HomeViewController() }
            .scope(.unique)

        container
            .register { HomePresenter() }
            .scope(.unique)
    }

    private func registerFavoritesViewController(in container: Resolver) {
        container
            .register { FavoriteMoviesViewController() }
            .scope(.unique)

        container
            .register { FavoriteMoviesPresenter() }
            .scope(.unique)
    }

    private func registerCustomTabBar(in container: Resolver) {
        container
            .register { CustomTabBarController() }
            .scope(.unique)
    }

    private func registerDetailsViewController(in container: Resolver) {
        container
            .register { DetailsViewController() }
            .scope(.unique)

        container
            .register { DetailsPresenter() }
            .scope(.unique)
    }

    private func registerSearchViewController(in container: Resolver) {
        container
            .register { MoviesSearchViewController() }
            .scope(.unique)

        container
            .register { MoviesSearchPresenter() }
            .scope(.unique)
    }

}
