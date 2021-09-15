import Combine

protocol LocalDataSourceProtocol {

    var favoriteMovies: AnyPublisher<[LocalFavoritesDataSourceModel], Never> { get }

    func updateFavoriteMovies(with model: LocalFavoritesDataSourceModel)

    func saveMovies(models: [LocalMovieDataSourceModel], category: LocalCategory)

    func getMovies(for category: LocalCategory) -> AnyPublisher<[LocalMovieDataSourceModel], Error>

}
