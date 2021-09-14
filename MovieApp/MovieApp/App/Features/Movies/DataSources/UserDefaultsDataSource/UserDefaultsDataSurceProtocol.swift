import Combine

protocol UserDefaultsDataSourceProtocol {

    var items: AnyPublisher<[Int], Never> { get }

    func toggle(with id: Int)

}
