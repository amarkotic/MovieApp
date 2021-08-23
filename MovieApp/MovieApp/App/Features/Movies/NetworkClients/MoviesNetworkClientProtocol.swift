import Combine

protocol MoviesNetworkClientProtocol {
    
    func getMovies(
        categoryDataSourceModel: MovieCategoryDataSourceModel,
        subcategoryDataSourceModel: SubcategoryDataSourceModel,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )

    func getMovie(with id: Int) -> AnyPublisher<MovieDetailsNetworkModel, Error>

    func getCredits(with id: Int) -> AnyPublisher<CreditsNetworkModel, Error>
    
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
