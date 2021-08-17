import Foundation

class UserDefaultsRepository: UserDefaultsRepositoryProtocol {
    
    private let favoritesDataSource: FavoritesUserDefaultsDataSourceProtocol
    
    var favoriteItems: [Int] {
        favoritesDataSource
            .items
    }
    
    init(favoritesDataSource: FavoritesUserDefaultsDataSourceProtocol) {
        self.favoritesDataSource = favoritesDataSource
    }
    
    func updateFavorites(with id: Int) {
        favoritesDataSource
            .toggle(with: id)
    }
    
}
