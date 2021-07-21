protocol MoviesUseCaseProtocol {
    
    func fetchMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void)
    
}
