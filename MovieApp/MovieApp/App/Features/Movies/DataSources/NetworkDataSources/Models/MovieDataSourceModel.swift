import UIKit

struct MovieDataSourceModel {
    
    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let subcategories: [SubcategoryDataSourceModel]
    
    init(from networkModel: MovieNetworkModel) {
        id = networkModel.id
        imageUrl = NetworkConstants.imagePath + networkModel.imageUrl
        title = networkModel.title
        description = networkModel.description
        subcategories = networkModel.genreIds.compactMap {
            SubcategoryDataSourceModel(rawValue: $0)
        }
    }
}
