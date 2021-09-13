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

}
