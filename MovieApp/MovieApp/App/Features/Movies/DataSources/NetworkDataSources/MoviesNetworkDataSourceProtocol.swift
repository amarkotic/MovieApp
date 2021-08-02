protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        category: CategoryEnum, subcategory: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    )
    
}
