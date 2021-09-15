import Foundation
import Realm
import Combine

class FavoritesRepository: FavoritesRepositoryProtocol {

    private let localDataSource: LocalDataSourceProtocol

    var favoriteMovies: AnyPublisher<[LocalFavoritesRepositoryModel], Never> {
        localDataSource
            .favoriteMovies
            .map { $0.map { LocalFavoritesRepositoryModel(from: $0) }}
            .eraseToAnyPublisher()
    }

    init(localDataSource: LocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    func updateFavorites(with model: LocalFavoritesRepositoryModel) {
        localDataSource
            .updateFavoriteMovies(with: LocalFavoritesDataSourceModel(from: model))
    }

}
