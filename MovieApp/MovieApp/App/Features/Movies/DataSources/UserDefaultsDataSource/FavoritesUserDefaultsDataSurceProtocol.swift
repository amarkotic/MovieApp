import Combine

protocol FavoritesUserDefaultsDataSourceProtocol {

    var items: AnyPublisher<[Int], Never> { get }

    func toggle(with id: Int)

}
