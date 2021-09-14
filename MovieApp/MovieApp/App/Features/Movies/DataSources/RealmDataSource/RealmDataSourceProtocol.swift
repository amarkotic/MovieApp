import Combine

protocol RealmDataSourceProtocol {

    var favoriteMovies: AnyPublisher<[RealmFavoritesDataSourceModel], Never> { get }

    func saveData(model: [RealmDataSourceModel], category: RealmCategory)

    func getMovies(for category: RealmCategory) -> AnyPublisher<[RealmDataSourceModel], Error>

    func saveFavoriteMovies(model: [RealmFavoritesDataSourceModel])

}
