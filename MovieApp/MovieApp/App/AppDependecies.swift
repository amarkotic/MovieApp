class AppDependencies {

    lazy var networkService: NetworkServiceProtocol = {
        NetworkService()
    }()

    lazy var moviesNetworkClient: MoviesNetworkClientProtocol = {
        MoviesNetworkClient(networkService: networkService)
    }()

    lazy var moviesNetworkDataSource: MoviesNetworkDataSourceProtocol = {
        MoviesNetworkDataSource(networkClient: moviesNetworkClient)
    }()

    lazy var realmDataSource: RealmDataSourceProtocol = {
        RealmDataSource()
    }()

    lazy var userDefaultsDataSource: UserDefaultsDataSourceProtocol = {
        UserDefaultsDataSource()
    }()

    lazy var moviesRepository: MoviesRepositoryProtocol = {
        MoviesRepository(networkDataSource: moviesNetworkDataSource, realmDataSource: realmDataSource)
    }()

    lazy var favoritesRepository: FavoritesRepositoryProtocol = {
        FavoritesRepository(realmDataSource: realmDataSource, userDefaultsDataSource: userDefaultsDataSource)
    }()

    lazy var moviesUseCase: MoviesUseCaseProtocol = {
        MoviesUseCase(
            moviesRepository: moviesRepository,
            favoritesRepository: favoritesRepository)
    }()

}
