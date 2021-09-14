import Foundation
import Realm
import Combine

class RealmRepository: RealmRepositoryProtocol {

    private let realmDataSource: RealmDataSourceProtocol!

    var favoriteMovies: AnyPublisher<[RealmFavoritesRepositoryModel], Never> {
        realmDataSource
            .favoriteMovies
            .map { $0.map { RealmFavoritesRepositoryModel(from: $0) }}
            .eraseToAnyPublisher()
    }

    init(realmDataSource: RealmDataSourceProtocol) {
        self.realmDataSource = realmDataSource
    }

    func saveFavorites(with model: [RealmFavoritesRepositoryModel]) {
        realmDataSource.saveFavoriteMovies(models: model.map { RealmFavoritesDataSourceModel(from: $0) })
    }

}
