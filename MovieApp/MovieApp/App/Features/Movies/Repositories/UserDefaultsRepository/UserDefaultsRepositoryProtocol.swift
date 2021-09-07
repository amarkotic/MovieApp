import Combine

protocol UserDefaultsRepositoryProtocol {
    
    var oldFavoriteItems: [Int] { get }
    
    var favoriteItems: AnyPublisher<[Int], Never>  { get }
    
    func updateFavorites(with id: Int)
    
}
