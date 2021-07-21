protocol MoviesNetworkDataSourceProtocol {
  
    func fetchMovies(completion: @escaping (Result<[MovieDataSourceModel], NetworkError>) -> Void)
    
}
