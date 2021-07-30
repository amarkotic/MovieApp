protocol MoviesUseCaseProtocol {
    
    func fetchSearchMovies(category: CategoryEnum, completion: @escaping (Result<[MovieSearchModel], Error>) -> Void) 
    
    func fetchPosterMovies(category: CategoryEnum, subcategory: SubcategoryEnum, completion: @escaping (Result<[MoviePosterModel], Error>) -> Void)
}
