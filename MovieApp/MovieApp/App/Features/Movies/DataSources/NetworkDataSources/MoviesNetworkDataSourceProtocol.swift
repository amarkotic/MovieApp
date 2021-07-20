protocol MoviesNetworkDataSourceProtocol {
  
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void)
    
}
