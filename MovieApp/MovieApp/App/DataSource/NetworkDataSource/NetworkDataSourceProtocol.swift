protocol NetworkDataSourceProtocol {
  
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void)
    
}
