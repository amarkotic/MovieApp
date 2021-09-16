import Foundation
import Combine
import Resolver

class FavoritesRepository: FavoritesRepositoryProtocol {

    @Injected private var localDataSource: LocalDataSourceProtocol

    var favoriteMovies: AnyPublisher<[LocalFavoritesRepositoryModel], Never> {
        localDataSource
            .favoriteMovies
            .map { $0.map { LocalFavoritesRepositoryModel(from: $0) }}
            .eraseToAnyPublisher()
    }

    func updateFavorites(with model: LocalFavoritesRepositoryModel) {
        localDataSource
            .updateFavoriteMovies(with: LocalFavoritesDataSourceModel(from: model))
    }

}
