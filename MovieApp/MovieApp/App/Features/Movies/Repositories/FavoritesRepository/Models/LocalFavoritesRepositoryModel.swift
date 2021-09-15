struct LocalFavoritesRepositoryModel {

    let id: Int
    let imageUrl: String

}

extension LocalFavoritesRepositoryModel {

    init(from model: MovieDetailsRepositoryModel) {
        id = model.id
        imageUrl = model.posterPath
    }

    init(from model: LocalFavoritesDataSourceModel) {
        id = model.id
        imageUrl = model.imageUrl
    }

    init(from model: MovieModel) {
        id = model.id
        imageUrl = model.imageUrl
    }

}
