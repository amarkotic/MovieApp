import Combine

protocol MoviesUseCaseProtocol {

    var favoriteMovies: AnyPublisher<[FavoriteMovieModel], Never> { get }

    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel
    ) -> AnyPublisher<[MovieModel], Error>

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsModel, Error>

    func fetchCredits(with id: Int) -> AnyPublisher<CreditsModel, Error>

    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewModel], Error>

    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationModel], Error>

    func updateFavorites(with id: Int)

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchModel], Error>

}
