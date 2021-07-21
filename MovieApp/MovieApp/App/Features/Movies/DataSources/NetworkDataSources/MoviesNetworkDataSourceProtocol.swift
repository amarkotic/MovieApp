protocol MoviesNetworkDataSourceProtocol {
  
    func fetchMovies(completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void)
    
}
