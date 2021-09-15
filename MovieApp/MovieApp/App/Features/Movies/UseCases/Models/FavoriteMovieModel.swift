struct FavoriteMovieModel {

    let id: Int
    let imageUrl: String
    let isSelected: Bool

}

extension FavoriteMovieModel {

    init(from model: LocalFavoritesRepositoryModel) {
        id = model.id
        imageUrl = model.imageUrl
        isSelected = true
    }

}
