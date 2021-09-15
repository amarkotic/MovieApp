import Foundation
import RealmSwift

class LocalMovieDataSourceModel: Object {

    @Persisted var id: Int
    @Persisted var imageUrl: String
    @Persisted var title: String
    @Persisted var category: String
    @Persisted var localDescription: String
    @Persisted var subcategories = List<Int>()

}

extension LocalMovieDataSourceModel {

    convenience init(from model: MovieDataSourceModel, localCategory: LocalCategory) {
        self.init()
        id = model.id
        imageUrl = model.imageUrl
        title = model.title
        category = localCategory.rawValue
        localDescription = model.description
        subcategories.append(objectsIn: model.subcategories.map { $0.rawValue })
    }

}
