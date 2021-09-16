import Foundation
import Combine

class FavoritesRepository: FavoritesRepositoryProtocol {

    private let localDataSource: LocalDataSourceProtocol

    init(localDataSource: LocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

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
