import Foundation
import Realm
import Combine

class FavoritesRepository: FavoritesRepositoryProtocol {

    private let realmDataSource: RealmDataSourceProtocol
    private let userDefaultsDataSource: UserDefaultsDataSourceProtocol

    var favoriteMovies: AnyPublisher<[RealmFavoritesRepositoryModel], Never> {
        realmDataSource
            .favoriteMovies
            .map { $0.map { RealmFavoritesRepositoryModel(from: $0) }}
            .eraseToAnyPublisher()
    }

    var favoriteMovieIds: AnyPublisher<[Int], Never> {
        userDefaultsDataSource
            .items
            .eraseToAnyPublisher()
    }

    init(
        realmDataSource: RealmDataSourceProtocol,
        userDefaultsDataSource: UserDefaultsDataSourceProtocol
    ) {
        self.realmDataSource = realmDataSource
        self.userDefaultsDataSource = userDefaultsDataSource
    }

    func saveFavorites(with model: [RealmFavoritesRepositoryModel]) {
        realmDataSource.saveFavoriteMovies(models: model.map { RealmFavoritesDataSourceModel(from: $0) })
    }

    func updateFavorites(with id: Int) {
        userDefaultsDataSource
            .toggle(with: id)
    }

}
