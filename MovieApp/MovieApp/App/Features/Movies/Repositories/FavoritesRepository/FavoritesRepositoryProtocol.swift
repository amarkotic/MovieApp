import Combine

protocol FavoritesRepositoryProtocol {

    var favoriteMovies: AnyPublisher<[RealmFavoritesRepositoryModel], Never> { get }

    var favoriteMovieIds: AnyPublisher<[Int], Never> { get }

    func saveFavorites(with model: [RealmFavoritesRepositoryModel])

    func updateFavorites(with id: Int)

}
