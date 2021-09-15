import Foundation

struct MovieRepositoryModel {

    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let subcategories: [SubcategoryRepositoryModel]

}

extension MovieRepositoryModel {

    init(from networkDataSourceModel: MovieDataSourceModel) {
        id = networkDataSourceModel.id
        imageUrl = networkDataSourceModel.imageUrl
        title = networkDataSourceModel.title
        description = networkDataSourceModel.description
        subcategories = networkDataSourceModel.subcategories.compactMap {
            SubcategoryRepositoryModel(from: $0)
        }
    }

    init(from localDataSourceModel: LocalMovieDataSourceModel) {
        id = localDataSourceModel.id
        imageUrl = localDataSourceModel.imageUrl
        title = localDataSourceModel.title
        description = localDataSourceModel.description
        subcategories = localDataSourceModel.subcategories.map {
            guard let dataSourceSubcategory = SubcategoryDataSourceModel(rawValue: $0) else { return .none }

            return SubcategoryRepositoryModel(from: dataSourceSubcategory)
        }

    }
}
