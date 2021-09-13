import Foundation
import Realm
import Combine

class RealmRepository: RealmRepositoryProtocol {

    private let realmDataSource = RealmDataSource()

    func saveFavorites(with model: [MovieDetailsRepositoryModel]) {
        realmDataSource.saveFavoriteMovies(model: model.map { RealmFavoritesRepositoryModel(from: $0)})
    }

    func getFavoriteMovies() -> AnyPublisher<[FavoriteMovieModel], Never> {
        realmDataSource.getFavoriteMovies()
    }

}
