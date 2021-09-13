import Combine

protocol RealmRepositoryProtocol {

    func saveFavorites(with model: [MovieDetailsRepositoryModel])

    func getFavoriteMovies() -> AnyPublisher<[FavoriteMovieModel], Never>

}
