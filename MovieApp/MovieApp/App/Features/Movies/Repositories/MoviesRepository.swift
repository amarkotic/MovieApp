import Combine
import RealmSwift

class MoviesRepository: MoviesRepositoryProtocol {

    private let realmDataSource: RealmDataSource
    private let networkDataSource: MoviesNetworkDataSourceProtocol

    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
        self.realmDataSource = RealmDataSource()
    }

    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel
    ) -> AnyPublisher<[MovieRepositoryModel], Error> {
        let categoryRepoModel = MovieCategoryRepositoryModel(from: categoryModel)
        let subcategoryRepoModel = SubcategoryRepositoryModel(from: subcategoryModel)
        let realmCategory = RealmCategory(from: categoryRepoModel)

        return networkDataSource
            .fetchMovies(categoryRepositoryModel: categoryRepoModel, subcategoryRepositoryModel: subcategoryRepoModel)
            .handleEvents(receiveOutput: { [weak self] in
                self?.realmDataSource.saveData(model: $0, category: realmCategory)
            })
            .flatMap { _ -> AnyPublisher<[MovieRepositoryModel], Error> in
                guard let realm = try? Realm() else { return .empty()}

                let moviesInCurrentCategory = realm
                    .objects(RealmDataSourceModel.self)
                    .filter("category = %@", realmCategory.rawValue)
                    .map {
                        MovieRepositoryModel(from: $0)
                    }
                return Just(Array(moviesInCurrentCategory))
                    .setFailureType(to: Error.self)
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
