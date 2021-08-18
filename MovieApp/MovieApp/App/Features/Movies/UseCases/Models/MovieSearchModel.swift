import UIKit

struct MovieSearchModel {
    
    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    
    init(from repositoryModel: MovieRepositoryModel) {
        id = repositoryModel.id
        imageUrl = repositoryModel.imageUrl
        title = repositoryModel.title
        description = repositoryModel.description
    }
    
}
