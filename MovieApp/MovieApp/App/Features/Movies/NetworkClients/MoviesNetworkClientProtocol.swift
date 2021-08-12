protocol MoviesNetworkClientProtocol {
    
    func getMovies(
        categoryDataSourceModel: MovieCategoryDataSourceModel,
        subcategoryDataSourceModel: SubcategoryDataSourceModel,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )
    
    func getMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsNetworkModel, NetworkError>) -> Void
    ) 
    
}
