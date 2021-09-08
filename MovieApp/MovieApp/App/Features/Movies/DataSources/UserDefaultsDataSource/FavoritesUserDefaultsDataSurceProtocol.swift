import Combine

protocol FavoritesUserDefaultsDataSourceProtocol {

    var oldItems: [Int] { get }

    var items: AnyPublisher<[Int], Never> { get }

    func toggle(with id: Int)

}
