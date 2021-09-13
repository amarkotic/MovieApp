import Combine

protocol UserDefaultsRepositoryProtocol {

    var favoriteItems: AnyPublisher<[Int], Never> { get }

    func updateFavorites(with id: Int)

}
