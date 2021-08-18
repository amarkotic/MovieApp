import UIKit

struct MovieSearchViewModel {
    
    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    
    init(from model: MovieSearchModel) {
        id = model.id
        imageUrl = model.imageUrl
        title = model.title
        description = model.description
    }
    
}

