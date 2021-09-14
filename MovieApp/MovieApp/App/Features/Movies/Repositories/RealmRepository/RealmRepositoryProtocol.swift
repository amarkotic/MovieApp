import Combine

protocol RealmRepositoryProtocol {

    func saveFavorites(with model: [RealmFavoritesRepositoryModel])

    func getFavoriteMovies() -> AnyPublisher<[RealmFavoritesRepositoryModel], Never>

}
