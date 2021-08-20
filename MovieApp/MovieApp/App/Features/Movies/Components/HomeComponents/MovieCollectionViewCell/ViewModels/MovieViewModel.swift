import Foundation

struct MovieViewModel: Hashable{

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
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
