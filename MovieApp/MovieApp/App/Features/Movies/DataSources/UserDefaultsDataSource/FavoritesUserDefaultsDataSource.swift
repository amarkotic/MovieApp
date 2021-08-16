import Foundation

class FavoritesUserDefaultsDataSource: FavoritesUserDefaultsDataSourceProtocol {
    
    var items: [Int] {
        guard
            let items = UserDefaults.standard.array(forKey: UserDefaultsKeys.favorites.rawValue) as? [Int]
        else {
            return []
        }

        return items
    }
    
    init() {
        guard
            UserDefaults.standard.array(forKey: UserDefaultsKeys.favorites.rawValue) is [Int]
        else {
            UserDefaults.standard.set([], forKey: UserDefaultsKeys.favorites.rawValue)
            return
        }
    }
    
    
    func toggle(with id: Int) {
        guard
            var favoriteIds = UserDefaults.standard.array(forKey: UserDefaultsKeys.favorites.rawValue) as? [Int]
        else {
            return
        }
        
        favoriteIds.contains(id) ? favoriteIds.remove(object: id) : favoriteIds.append(id)
        UserDefaults.standard.set(favoriteIds, forKey: UserDefaultsKeys.favorites.rawValue)
    }
    
}
