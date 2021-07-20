class NetworkDataSource: NetworkDataSourceProtocol {

    private let moviesNetworkService: MoviesNetworkClientProtocol
    
    init(moviesNetworkService: MoviesNetworkClientProtocol) {
        self.moviesNetworkService = moviesNetworkService
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        moviesNetworkService.getMovies(completion: completion)
    }
    
}
