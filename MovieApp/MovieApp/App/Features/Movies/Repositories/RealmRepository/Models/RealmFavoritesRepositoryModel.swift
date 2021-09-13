struct RealmFavoritesRepositoryModel {

    let id: Int
    let imageUrl: String

}

extension RealmFavoritesRepositoryModel {

    init(from model: MovieDetailsRepositoryModel) {
        id = model.id
        imageUrl = model.posterPath
    }

    init(from model: RealmFavoritesDataSourceModel) {
        id = model.id
        imageUrl = model.imageUrl
    }
}
