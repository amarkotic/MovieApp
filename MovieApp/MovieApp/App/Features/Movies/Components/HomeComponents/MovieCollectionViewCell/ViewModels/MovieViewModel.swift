import Foundation

struct MovieViewModel: Hashable {
    
    let id: Int
    let imageUrl: String
    let isFavorite: Bool

}

extension MovieViewModel {
    
    init(from model: FavoriteMovieModel) {
        id = model.id
        imageUrl = model.imageUrl
        isFavorite = model.isSelected
    }
    
}
