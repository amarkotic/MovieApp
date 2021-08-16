protocol UserDefaultsRepositoryProtocol {
    
    var favoriteItems: [Int] { get }
    
    func updateFavorites(with id: Int)
    
}
