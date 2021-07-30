protocol MoviesRepositoryProtocol {
    
    func fetchMovies(
        category: CategoryEnum, subcategory: SubcategoryEnum,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )
    
}
