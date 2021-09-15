import Combine

class MoviesRepository: MoviesRepositoryProtocol {

    private let localDataSource: LocalDataSourceProtocol
    private let networkDataSource: MoviesNetworkDataSourceProtocol

    init(networkDataSource: MoviesNetworkDataSourceProtocol, localDataSource: LocalDataSourceProtocol) {
        self.networkDataSource = networkDataSource
        self.localDataSource = localDataSource
    }

    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel
    ) -> AnyPublisher<[MovieRepositoryModel], Error> {
        let categoryRepoModel = MovieCategoryRepositoryModel(from: categoryModel)
        let subcategoryRepoModel = SubcategoryRepositoryModel(from: subcategoryModel)
        let localCategory = LocalCategory(from: categoryRepoModel)

        return networkDataSource
            .fetchMovies(categoryRepositoryModel: categoryRepoModel, subcategoryRepositoryModel: subcategoryRepoModel)
            .handleEvents(receiveOutput: { [weak self] in
                let localMovieDataSourceModel = $0.map {
                    LocalMovieDataSourceModel(from: $0, localCategory: localCategory)
                }
                self?.localDataSource.saveMovies(models: localMovieDataSourceModel, category: localCategory)
            })
            .flatMap { [weak self] _ -> AnyPublisher<[MovieRepositoryModel], Error> in
                guard let self = self else { return .never() }

                return self.localDataSource
                    .getMovies(for: localCategory)
                    .map { $0.map { MovieRepositoryModel(from: $0) } }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsRepositoryModel, Error> {
        networkDataSource
            .fetchMovie(with: id)
            .map { MovieDetailsRepositoryModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchCredits(with id: Int) -> AnyPublisher<CreditsRepositoryModel, Error> {
        networkDataSource
            .fetchCredits(with: id)
            .map { CreditsRepositoryModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewRepositoryModel], Error> {
        networkDataSource
            .fetchReviews(with: id)
            .map { $0.map { ReviewRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationRepositoryModel], Error> {
        networkDataSource
            .fetchRecommendations(with: id)
            .map { $0.map { RecommendationRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieRepositoryModel], Error> {
        networkDataSource
            .fetchSearchMovies(with: query)
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
