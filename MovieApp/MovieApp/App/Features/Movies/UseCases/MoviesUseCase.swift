import UIKit
import Combine
import RealmSwift

class MoviesUseCase: MoviesUseCaseProtocol {

    private let moviesRepository: MoviesRepositoryProtocol
    private let userDefaultsRepository: UserDefaultsRepositoryProtocol
    private let realmRepository: RealmRepositoryProtocol

    var favoriteMovies: AnyPublisher<[FavoriteMovieModel], Never> {
        userDefaultsRepository
            .favoriteItems
            .setFailureType(to: Error.self)
            .flatMap { [weak self] ids -> AnyPublisher<[MovieDetailsRepositoryModel], Error> in
                guard let self = self else { return .never() }

                let movieStreams = ids.map {
                    self.moviesRepository.fetchMovie(with: $0)
                }
                return Publishers.MergeMany(movieStreams)
                    .collect()
                    .eraseToAnyPublisher()
            }
            .handleEvents(receiveOutput: { [weak self] model in
                self?.realmRepository.saveFavorites(with: model)
            })
            .replaceError(with: [])
            .flatMap { [weak self] _ -> AnyPublisher<[FavoriteMovieModel], Never> in
                guard let self = self else { return .empty() }

                return self.realmRepository.getFavoriteMovies()
            }
            .eraseToAnyPublisher()
    }

    init(
        moviesRepository: MoviesRepositoryProtocol,
        userDefaultsRepository: UserDefaultsRepositoryProtocol,
        realmRepository: RealmRepositoryProtocol
    ) {
        self.moviesRepository = moviesRepository
        self.userDefaultsRepository = userDefaultsRepository
        self.realmRepository = realmRepository
    }

    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel
    ) -> AnyPublisher<[MovieModel], Error> {
        let favoriteIdsPublisher = userDefaultsRepository
            .favoriteItems
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        return moviesRepository
            .fetchMovies(categoryModel: categoryModel, subcategoryModel: subcategoryModel)
            .combineLatest(favoriteIdsPublisher)
            .map {
                let favoriteIds = $0.1
                return $0.0.map {
                    let isFavorite = favoriteIds.contains($0.id)
                    return MovieModel(from: $0, isFavorite: isFavorite)
                }
                .filter {
                    categoryModel == .trending ? true : $0.subcategories.contains(subcategoryModel)
                }
            }
            .eraseToAnyPublisher()
    }

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsModel, Error> {
        let favoriteIdsPublisher = userDefaultsRepository
            .favoriteItems
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        return moviesRepository
            .fetchMovie(with: id)
            .combineLatest(favoriteIdsPublisher)
            .map {
                let isSelected = $0.1.contains(id)
                return MovieDetailsModel(from: $0.0, isSelected: isSelected)
            }
            .eraseToAnyPublisher()
    }

    func fetchCredits(with id: Int) -> AnyPublisher<CreditsModel, Error> {
        moviesRepository
            .fetchCredits(with: id)
            .map { CreditsModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewModel], Error> {
        moviesRepository
            .fetchReviews(with: id)
            .map { $0.map { ReviewModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationModel], Error> {
        moviesRepository
            .fetchRecommendations(with: id)
            .map { $0.map { RecommendationModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func updateFavorites(with id: Int) {
        userDefaultsRepository
            .updateFavorites(with: id)
    }

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchModel], Error> {
        moviesRepository
            .fetchSearchMovies(with: query)
            .map { $0.map { MovieSearchModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
