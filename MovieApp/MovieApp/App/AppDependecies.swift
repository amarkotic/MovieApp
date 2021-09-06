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

    lazy var moviesRepository: MoviesRepositoryProtocol = {
        MoviesRepository(networkDataSource: moviesNetworkDataSource)
    }()

    lazy var userDefaultsRepository: UserDefaultsRepository = {
        UserDefaultsRepository(favoritesDataSource: FavoritesUserDefaultsDataSource())
    }()

    lazy var moviesUseCase: MoviesUseCaseProtocol = {
        MoviesUseCase(moviesRepository: moviesRepository, userDefaultsRepository: userDefaultsRepository)
    }()

}
