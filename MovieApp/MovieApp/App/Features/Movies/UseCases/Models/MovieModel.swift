import UIKit

struct MovieModel {

    let id: Int
    let imageUrl: String
    let isSelected: Bool
    let subcategories: [SubcategoryModel]
}

extension MovieModel {

    init(from model: MovieRepositoryModel, isFavorite: Bool) {
        id = model.id
        imageUrl = model.imageUrl
        isSelected = isFavorite
        subcategories = model.subcategories.compactMap { SubcategoryModel(rawValue: $0.rawValue) }
    }

    init(from model: MovieViewModel) {
        id = model.id
        imageUrl = model.imageUrl
        isSelected = model.isFavorite
        subcategories = []
    }

}
