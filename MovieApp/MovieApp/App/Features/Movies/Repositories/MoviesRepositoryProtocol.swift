protocol MoviesRepositoryProtocol {
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) 
    
}
