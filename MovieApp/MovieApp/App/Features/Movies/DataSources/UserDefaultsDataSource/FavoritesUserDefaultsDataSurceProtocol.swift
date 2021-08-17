protocol FavoritesUserDefaultsDataSourceProtocol {
    
    var items: [Int] { get }
    
    func toggle(with id: Int)
    
}
