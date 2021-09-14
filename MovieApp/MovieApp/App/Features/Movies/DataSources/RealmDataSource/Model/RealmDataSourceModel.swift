import Foundation
import RealmSwift

class RealmDataSourceModel: Object {

    @Persisted var id: Int
    @Persisted var imageUrl: String
    @Persisted var title: String
    @Persisted var category: String
    @Persisted var realmDescription: String
    @Persisted var subcategories = List<Int>()

}

extension RealmDataSourceModel {

    convenience init(from model: MovieDataSourceModel, realmCategory: RealmCategory) {
        self.init()
        id = model.id
        imageUrl = model.imageUrl
        title = model.title
        category = realmCategory.rawValue
        realmDescription = model.description
        subcategories.append(objectsIn: model.subcategories.map { $0.rawValue })
    }

}
