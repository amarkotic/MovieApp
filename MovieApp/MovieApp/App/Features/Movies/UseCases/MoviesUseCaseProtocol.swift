protocol MoviesUseCaseProtocol {
    
    func fetchSearchMovies(
        category: MovieCategoryViewModel,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    )
    
    func fetchMovies(
        category: MovieCategoryViewModel,
        subcategory: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    )
    
}
