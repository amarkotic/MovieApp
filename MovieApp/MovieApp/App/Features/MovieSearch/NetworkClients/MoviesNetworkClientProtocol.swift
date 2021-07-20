protocol MoviesNetworkClientProtocol {
    
    func getMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void)
    
}
