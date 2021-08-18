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
    
    func getCast(
        with id: Int,
        completion: @escaping (Result<WholeCastNetworkModel, NetworkError>) -> Void
    )
    
    func getActors(
        with id: Int,
        completion: @escaping (Result<ActorsNetworkModel, NetworkError>) -> Void
    )
    
    func getReviews(
        with id: Int,
        completion: @escaping (Result<ReviewsNetworkModel, NetworkError>) -> Void
    )
    
    func getRecommendations(
        with id: Int,
        completion: @escaping (Result<RecommendationsNetworkModel, NetworkError>) -> Void
    ) 
    
    func getSearchMovies(
        with query: String,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )
    
}
