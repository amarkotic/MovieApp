import Foundation
import Realm
import Combine

class RealmRepository: RealmRepositoryProtocol {

    private let realmDataSource = RealmDataSource()

    func saveFavorites(with model: [RealmFavoritesRepositoryModel]) {
        realmDataSource.saveFavoriteMovies(model: model.map { RealmFavoritesDataSourceModel(from: $0)})
    }

    func getFavoriteMovies() -> AnyPublisher<[RealmFavoritesRepositoryModel], Never> {
        realmDataSource
            .favoriteMovies
            .map { $0.map { RealmFavoritesRepositoryModel(from: $0) }}
            .eraseToAnyPublisher()
    }

}
