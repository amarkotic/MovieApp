import Combine

protocol MoviesRepositoryProtocol {

    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsRepositoryModel, Error>

    func fetchCredits(with id: Int) -> AnyPublisher<CreditsRepositoryModel, Error>

    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewRepositoryModel], Error>

    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationRepositoryModel], Error>

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieRepositoryModel], Error>

}
