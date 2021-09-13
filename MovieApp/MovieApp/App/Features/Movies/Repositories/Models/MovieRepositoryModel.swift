import Foundation

struct MovieRepositoryModel {

    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let subcategories: [SubcategoryRepositoryModel]

}

extension MovieRepositoryModel {

    init(from dataSourceModel: MovieDataSourceModel) {
        id = dataSourceModel.id
        imageUrl = dataSourceModel.imageUrl
        title = dataSourceModel.title
        description = dataSourceModel.description
        subcategories = dataSourceModel.subcategories.compactMap {
            SubcategoryRepositoryModel(from: $0)
        }
    }

    init(from realmDataSourceModel: RealmDataSourceModel) {
        id = realmDataSourceModel.id
        imageUrl = realmDataSourceModel.imageUrl
        title = realmDataSourceModel.title
        description = realmDataSourceModel.description
        subcategories = realmDataSourceModel.subcategories.map {
            guard let dataSourceSubcategory = SubcategoryDataSourceModel(rawValue: $0) else { return .none }

            return SubcategoryRepositoryModel(from: dataSourceSubcategory)
        }

    }
}
