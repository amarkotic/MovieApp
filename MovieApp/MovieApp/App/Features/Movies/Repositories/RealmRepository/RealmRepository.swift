import Foundation
import Realm

class RealmRepository: RealmRepositoryProtocol {

    private let realmDataSource = RealmDataSource()

    func saveFavorites(with model: [MovieDetailsRepositoryModel]) {
        realmDataSource.saveFavoriteMovies(model: model.map { RealmFavoritesRepositoryModel(from: $0)})
    }

}
