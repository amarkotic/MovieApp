import Foundation
import RealmSwift

class LocalFavoritesDataSourceModel: Object {

    @Persisted var id: Int
    @Persisted var imageUrl: String

}

extension LocalFavoritesDataSourceModel {

    convenience init(from model: LocalFavoritesRepositoryModel) {
        self.init()
        id = model.id
        imageUrl = model.imageUrl
    }

}
