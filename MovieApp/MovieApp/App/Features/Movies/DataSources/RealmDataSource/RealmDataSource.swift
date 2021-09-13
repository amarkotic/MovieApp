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

    func getMovies(for category: RealmCategory) -> [RealmDataSourceModel] {
        guard let realm = try? Realm() else { return [] }

        return Array(realm
                        .objects(RealmDataSourceModel.self)
                        .filter("category = %@", category.rawValue))
    }

}
