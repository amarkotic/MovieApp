import Foundation
import RealmSwift
import Combine

class RealmDataSource: RealmDataSourceProtocol {

    func saveData(model: [MovieDataSourceModel], category: RealmCategory) {
        guard let realm = try? Realm() else { return }

        let oldMoviesInCurrentCategory = realm
            .objects(RealmDataSourceModel.self)
            .filter("category == %@", category.rawValue)
        let newMoviesInCurrentCategory = model
            .map { RealmDataSourceModel(from: $0, realmCategory: category) }

        try? realm.write({
            realm.delete(oldMoviesInCurrentCategory)
            realm.add(newMoviesInCurrentCategory)
        })
    }

    func saveFavoriteMovies(model: [RealmFavoritesRepositoryModel]) {
        guard let realm = try? Realm() else { return }

        let favorites = model.map { RealmFavoritesDataSourceModel(from: $0) }
        try? realm.write({
            realm.delete(realm.objects(RealmFavoritesDataSourceModel.self))
            realm.add(favorites)
        })
    }

    func getFavoriteMovies() -> AnyPublisher<[FavoriteMovieModel], Never> {
        guard let realm = try? Realm() else { return .empty() }

        let favoriteMovies = realm
            .objects(RealmFavoritesDataSourceModel.self)
            .map { FavoriteMovieModel(from: RealmFavoritesRepositoryModel(from: $0))}
        return Just(Array(favoriteMovies))
            .eraseToAnyPublisher()
    }
}
