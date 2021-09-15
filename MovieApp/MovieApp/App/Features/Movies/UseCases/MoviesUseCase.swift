import UIKit
import Combine

class MoviesUseCase: MoviesUseCaseProtocol {

    private let moviesRepository: MoviesRepositoryProtocol
    private let favoritesRepository: FavoritesRepositoryProtocol

    var favoriteMovies: AnyPublisher<[FavoriteMovieModel], Never> {
        favoritesRepository
            .favoriteMovies
            .flatMap { [weak self] _ -> AnyPublisher<[FavoriteMovieModel], Never> in
                guard let self = self else { return .empty() }

                return self.favoritesRepository
                    .favoriteMovies
                    .map { $0.map { FavoriteMovieModel(from: $0) } }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

    init(
        moviesRepository: MoviesRepositoryProtocol,
        favoritesRepository: FavoritesRepositoryProtocol
    ) {
        self.moviesRepository = moviesRepository
        self.favoritesRepository = favoritesRepository
    }

    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel
    ) -> AnyPublisher<[MovieModel], Error> {
        let favoriteIdsPublisher = favoritesRepository
            .favoriteMovies
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        return moviesRepository
            .fetchMovies(categoryModel: categoryModel, subcategoryModel: subcategoryModel)
            .combineLatest(favoriteIdsPublisher)
            .map {
                let favoriteIds = $0.1.map { $0.id }
                return $0.0.map {
                    let isFavorite = favoriteIds.contains($0.id)
                    return MovieModel(from: $0, isFavorite: isFavorite)
                }
                .filter { categoryModel == .trending || $0.subcategories.contains(subcategoryModel) }
            }
            .eraseToAnyPublisher()
    }

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsModel, Error> {
        let favoriteIdsPublisher = favoritesRepository
            .favoriteMovies
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        return moviesRepository
            .fetchMovie(with: id)
            .combineLatest(favoriteIdsPublisher)
            .map {
                let favoriteIds = $0.1.map { $0.id }
                let isSelected = favoriteIds.contains(id)
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

    func updateFavorites(with model: MovieModel) {
        favoritesRepository
            .updateFavorites(with: LocalFavoritesRepositoryModel(from: model))
    }

    func updateFavorites(id: Int, with url: String) {
        favoritesRepository
            .updateFavorites(with: LocalFavoritesRepositoryModel(id: id, imageUrl: url))
    }

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchModel], Error> {
        moviesRepository
            .fetchSearchMovies(with: query)
            .map { $0.map { MovieSearchModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
