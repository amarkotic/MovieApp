import Combine

class MoviesNetworkDataSource: MoviesNetworkDataSourceProtocol {

    private let networkClient: MoviesNetworkClientProtocol

    init(networkClient: MoviesNetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel
    ) -> AnyPublisher<[MovieDataSourceModel], Error> {

        let subcategoryDataSourceModel = SubcategoryDataSourceModel(from: subcategoryRepositoryModel)
        let categoryDataSourceModel = MovieCategoryDataSourceModel(from: categoryRepositoryModel)

        return networkClient
            .getMovies(
                categoryDataSourceModel: categoryDataSourceModel,
                subcategoryDataSourceModel: subcategoryDataSourceModel)
            .map { $0.results.map { MovieDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsDataSourceModel, Error> {
        networkClient
            .getMovie(with: id)
            .map { MovieDetailsDataSourceModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchCredits(with id: Int) -> AnyPublisher<CreditsDataSourceModel, Error> {
        networkClient
            .getCredits(with: id)
            .map { CreditsDataSourceModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewDataSourceModel], Error> {
        networkClient
            .getReviews(with: id)
            .map { $0.results.map { ReviewDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationDataSourceModel], Error> {
        networkClient
            .getRecommendations(with: id)
            .map { $0.results.map { RecommendationDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieDataSourceModel], Error> {
        networkClient
            .getSearchMovies(with: query)
            .map { $0.results.map { MovieDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
