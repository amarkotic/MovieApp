protocol MoviesNetworkClientProtocol {
    
    func getMovies(
        category: CategoryEnum, subcategory: SubcategoryEnum,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )
    
}
