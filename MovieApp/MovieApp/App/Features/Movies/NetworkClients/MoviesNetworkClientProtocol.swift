protocol MoviesNetworkClientProtocol {
    
    func getMovies(completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void)
    
}
