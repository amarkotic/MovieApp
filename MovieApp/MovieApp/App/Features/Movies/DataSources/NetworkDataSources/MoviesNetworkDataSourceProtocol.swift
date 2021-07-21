protocol MoviesNetworkDataSourceProtocol {
  
    func fetchMovies(completion: @escaping (NetworkResult<[MovieDataSourceModel], NetworkError>) -> Void)
    
}
