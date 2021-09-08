import UIKit

struct MovieRepositoryModel {

    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let subcategories: [SubcategoryRepositoryModel]

    init(from dataSourceModel: MovieDataSourceModel) {
        id = dataSourceModel.id
        imageUrl = dataSourceModel.imageUrl
        title = dataSourceModel.title
        description = dataSourceModel.description
        subcategories = dataSourceModel.subcategories.compactMap {
            SubcategoryRepositoryModel(from: $0)
        }
    }

}
