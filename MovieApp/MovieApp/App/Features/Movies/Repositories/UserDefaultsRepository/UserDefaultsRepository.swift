import Foundation
import Combine

class UserDefaultsRepository: UserDefaultsRepositoryProtocol {
    
    private let favoritesDataSource: FavoritesUserDefaultsDataSourceProtocol
    
    var oldFavoriteItems: [Int] {
        favoritesDataSource
            .oldItems
    }
    
    var favoriteItems: AnyPublisher<[Int], Never> {
        favoritesDataSource
            .items
            .receiveOnBackground()
    }
    
    init(favoritesDataSource: FavoritesUserDefaultsDataSourceProtocol) {
        self.favoritesDataSource = favoritesDataSource
    }
    
    func updateFavorites(with id: Int) {
        favoritesDataSource
            .toggle(with: id)
    }
    
}
