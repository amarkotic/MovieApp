protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        category: CategoryEnum, subcategory: SubcategoryEnum,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    )
    
}
