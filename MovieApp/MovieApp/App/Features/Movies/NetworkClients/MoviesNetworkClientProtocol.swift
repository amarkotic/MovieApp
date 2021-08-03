protocol MoviesNetworkClientProtocol {
    
    func getMovies(
        category: MovieCategoryDataSourceModel,
        subcategory: SubcategoryDataSourceModel,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )
    
}
