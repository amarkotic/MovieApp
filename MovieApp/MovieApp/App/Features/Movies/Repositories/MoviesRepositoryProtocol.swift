protocol MoviesRepositoryProtocol {
    
    func fetchMovies(
        category: MovieCategoryModel,
        subcategory: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )
    
}
