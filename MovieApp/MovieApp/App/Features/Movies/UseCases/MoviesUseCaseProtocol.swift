protocol MoviesUseCaseProtocol {
    
    func fetchMovies(completion: @escaping (NetworkResult<[MovieModel], NetworkError>) -> Void)
    
}
