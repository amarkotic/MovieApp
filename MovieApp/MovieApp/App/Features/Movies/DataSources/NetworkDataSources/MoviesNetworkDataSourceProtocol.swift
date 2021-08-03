protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        category: MovieCategoryRepositoryModel,
        subcategory: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    )
    
}
