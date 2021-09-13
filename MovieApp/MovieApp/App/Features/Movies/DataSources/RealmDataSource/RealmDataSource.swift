import Foundation
import RealmSwift
import Combine

class RealmDataSource: RealmDataSourceProtocol {

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

    func getMovies(for category: RealmCategory) -> AnyPublisher<[MovieRepositoryModel], Error> {
        guard let realm = try? Realm() else { return .empty()}

        let moviesInCurrentCategory = realm
            .objects(RealmDataSourceModel.self)
            .filter("category = %@", category.rawValue)
            .map { MovieRepositoryModel(from: $0) }
        return Just(Array(moviesInCurrentCategory))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

}
