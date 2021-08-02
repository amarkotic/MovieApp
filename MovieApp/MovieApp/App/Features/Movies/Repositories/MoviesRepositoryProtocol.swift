protocol MoviesRepositoryProtocol {
    
    func fetchMovies(
        category: CategoryEnum, subcategory: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )
    
}
