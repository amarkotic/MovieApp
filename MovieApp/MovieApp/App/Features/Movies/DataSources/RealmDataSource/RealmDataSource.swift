import Foundation
import RealmSwift
import Combine

class RealmDataSource: RealmDataSourceProtocol {

    var favoriteMovies: AnyPublisher<[RealmFavoritesDataSourceModel], Never> {
        guard let realm = try? Realm() else { return .empty() }

        return Just(Array(realm.objects(RealmFavoritesDataSourceModel.self)))
            .eraseToAnyPublisher()
    }

    func saveData(model: [RealmDataSourceModel], category: RealmCategory) {
        guard let realm = try? Realm() else { return }

        let oldMoviesInCurrentCategory = realm
            .objects(RealmDataSourceModel.self)
            .filter("category == %@", category.rawValue)

        try? realm.write({
            realm.delete(oldMoviesInCurrentCategory)
            realm.add(model)
        })
    }

    func getMovies(for category: RealmCategory) -> AnyPublisher<[RealmDataSourceModel], Error> {
        guard let realm = try? Realm() else { return .empty()}

        let moviesInCurrentCategory = realm
            .objects(RealmDataSourceModel.self)
            .filter("category = %@", category.rawValue)

        return Just(Array(moviesInCurrentCategory))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

  func saveFavoriteMovies(model: [RealmFavoritesDataSourceModel]) {
        guard let realm = try? Realm() else { return }

        try? realm.write({
            realm.delete(realm.objects(RealmFavoritesDataSourceModel.self))
            realm.add(model)
        })
    }

}
