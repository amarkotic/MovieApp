import Foundation
import RealmSwift

class RealmFavoritesDataSourceModel: Object {

    @Persisted var id: Int
    @Persisted var imageUrl: String

}

extension RealmFavoritesDataSourceModel {

    convenience init(from model: RealmFavoritesRepositoryModel) {
        self.init()
        id = model.id
        imageUrl = model.imageUrl
    }

}
