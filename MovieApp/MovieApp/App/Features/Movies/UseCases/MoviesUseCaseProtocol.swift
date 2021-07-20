protocol MoviesUseCaseProtocol {
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void)
    
}
