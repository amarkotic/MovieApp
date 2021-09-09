import Combine

protocol MoviesNetworkClientProtocol {

    func getMovies(
        category: MovieCategoryDataSourceModel,
        subcategory: SubcategoryDataSourceModel
    ) -> AnyPublisher<MoviesNetworkModel, Error>

    func getMovie(with id: Int) -> AnyPublisher<MovieDetailsNetworkModel, Error>

    func getCredits(with id: Int) -> AnyPublisher<CreditsNetworkModel, Error>

    func getReviews(with id: Int) -> AnyPublisher<ReviewsNetworkModel, Error>

    func getRecommendations(with id: Int) -> AnyPublisher<RecommendationsNetworkModel, Error>

    func getSearchMovies(with query: String) -> AnyPublisher<MoviesNetworkModel, Error>

}
