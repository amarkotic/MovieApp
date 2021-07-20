class Repository: RepositoryProtocol {
    
    private let networkDataSource: NetworkDataSourceProtocol
    
    init(networkDataSource: NetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        networkDataSource.fetchMovies(completion: completion)
    }
    
    
}
