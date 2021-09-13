protocol RealmDataSourceProtocol {

    func saveData(model: [MovieDataSourceModel], category: RealmCategory)

    func saveFavoriteMovies(model: [RealmFavoritesRepositoryModel])

}
