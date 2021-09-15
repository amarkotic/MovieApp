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

    lazy var localDataSource: LocalDataSourceProtocol = {
        LocalDataSource()
    }()

    lazy var moviesRepository: MoviesRepositoryProtocol = {
        MoviesRepository(networkDataSource: moviesNetworkDataSource, localDataSource: localDataSource)
    }()

    lazy var favoritesRepository: FavoritesRepositoryProtocol = {
        FavoritesRepository(localDataSource: localDataSource)
    }()

    lazy var moviesUseCase: MoviesUseCaseProtocol = {
        MoviesUseCase(
            moviesRepository: moviesRepository,
            favoritesRepository: favoritesRepository)
    }()

}
