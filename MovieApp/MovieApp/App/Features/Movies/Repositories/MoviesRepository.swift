class MoviesRepository: MoviesRepositoryProtocol {
    
    private let networkDataSource: MoviesNetworkDataSourceProtocol
    
    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        networkDataSource.fetchMovies(completion: completion)
    }
    
}
