protocol MoviesUseCaseProtocol {
    
    func fetchSearchMovies(
        category: CategoryEnum,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    )
    
    func fetchMovies(
        category: CategoryEnum,
        subcategory: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    )
    
}
