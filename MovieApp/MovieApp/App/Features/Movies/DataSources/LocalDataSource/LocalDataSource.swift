import Foundation
import RealmSwift
import Combine

class LocalDataSource: LocalDataSourceProtocol {

    var favoriteMovies: AnyPublisher<[LocalFavoritesDataSourceModel], Never> {
        guard let realm = try? Realm() else { return .empty() }

        return realm.objects(LocalFavoritesDataSourceModel.self)
            .collectionPublisher
            .map { Array($0) }
            .assertNoFailure()
            .eraseToAnyPublisher()
    }

    func updateFavoriteMovies(with model: LocalFavoritesDataSourceModel) {
        guard let realm = try? Realm() else { return }

        let favoriteIds = realm
            .objects(LocalFavoritesDataSourceModel.self)
            .map { $0.id }

        try? realm.write {
            let currentFavoriteMovieInRealm = realm
                .objects(LocalFavoritesDataSourceModel.self)
                .filter("id = %@", model.id)
            favoriteIds.contains(model.id) ? realm.delete(currentFavoriteMovieInRealm) : realm.add(model)
        }

    }

    func saveMovies(models: [LocalMovieDataSourceModel], category: LocalCategory) {
        guard let realm = try? Realm() else { return }

        let oldMoviesInCurrentCategory = realm
            .objects(LocalMovieDataSourceModel.self)
            .filter("category == %@", category.rawValue)

        try? realm.write({
            realm.delete(oldMoviesInCurrentCategory)
            realm.add(models)
        })
    }

    func getMovies(for category: LocalCategory) -> AnyPublisher<[LocalMovieDataSourceModel], Error> {
        guard let realm = try? Realm() else { return .empty()}

        let moviesInCurrentCategory = realm
            .objects(LocalMovieDataSourceModel.self)
            .filter("category = %@", category.rawValue)

        return Just(Array(moviesInCurrentCategory))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

}
