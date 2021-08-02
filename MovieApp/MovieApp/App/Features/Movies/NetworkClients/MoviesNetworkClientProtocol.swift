protocol MoviesNetworkClientProtocol {
    
    func getMovies(
        category: CategoryEnum, subcategory: SubcategoryDataSourceModel,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )
    
}
