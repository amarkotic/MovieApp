protocol MoviesNetworkDataSourceProtocol {
  
    func fetchMovies(category: CategoryEnum, completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void)
    
}
