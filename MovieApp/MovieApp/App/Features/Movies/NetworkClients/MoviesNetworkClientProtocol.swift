import Combine

protocol MoviesNetworkClientProtocol {

    func getMovies(
        categoryDataSourceModel: MovieCategoryDataSourceModel,
        subcategoryDataSourceModel: SubcategoryDataSourceModel,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    )

    func getMovie(with id: Int) -> AnyPublisher<MovieDetailsNetworkModel, Error>

    func getCredits(with id: Int) -> AnyPublisher<CreditsNetworkModel, Error>

    func getReviews(with id: Int) -> AnyPublisher<ReviewsNetworkModel, Error>

    func getRecommendations(with id: Int) -> AnyPublisher<RecommendationsNetworkModel, Error>

    func getSearchMovies(with query: String) -> AnyPublisher<MoviesNetworkModel, Error>

}
