class NetworkDataSource: NetworkDataSourceProtocol {

    private let moviesNetworkClient: MoviesNetworkClientProtocol
    
    init(moviesNetworkClient: MoviesNetworkClientProtocol) {
        self.moviesNetworkClient = moviesNetworkClient
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        moviesNetworkClient.getMovies(completion: completion)
    }
    
}
