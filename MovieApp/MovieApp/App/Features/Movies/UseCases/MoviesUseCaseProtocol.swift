protocol MoviesUseCaseProtocol {
    
    func fetchSearchMovies(
        category: MovieCategoryViewModel,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    )
    
    func fetchMovies(
        categoryViewModel: MovieCategoryViewModel,
        subcategoryViewModel: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    )
    
}
