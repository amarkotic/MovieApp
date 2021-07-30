protocol MoviesRepositoryProtocol {
    
    func fetchMovies(category: CategoryEnum, completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void) 
    
}
