import Combine

protocol FavoritesRepositoryProtocol {

    var favoriteMovies: AnyPublisher<[LocalFavoritesRepositoryModel], Never> { get }

    func updateFavorites(with model: LocalFavoritesRepositoryModel)

}
