class MoviesNetworkDataSource: MoviesNetworkDataSourceProtocol {

    private let networkClient: MoviesNetworkClientProtocol
    
    init(networkClient: MoviesNetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        networkClient.getMovies(completion: completion)
    }
    
}
