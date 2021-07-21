protocol MoviesRepositoryProtocol {
    
    func fetchMovies(completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void)
    
}
