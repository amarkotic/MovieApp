import Combine

protocol RealmRepositoryProtocol {

    var favoriteMovies: AnyPublisher<[RealmFavoritesRepositoryModel], Never> { get }

    func saveFavorites(with model: [RealmFavoritesRepositoryModel])

}
