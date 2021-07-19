import UIKit

struct MovieViewModel {
    
    var imageUrl: String
    let title: String
    let description: String
    
    init(with model: MovieNetworkModel) {
        imageUrl = "https://image.tmdb.org/t/p/original" + model.imageUrl
        title = model.title
        description = model.description
    }
    
}
