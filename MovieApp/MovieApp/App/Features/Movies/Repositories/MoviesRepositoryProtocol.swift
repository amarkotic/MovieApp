protocol MoviesRepositoryProtocol {
    
    func fetchMovies(completion: @escaping (NetworkResult<[MovieRepositoryModel], NetworkError>) -> Void)
    
}
