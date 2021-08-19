import Foundation

extension UserDefaults {
    
    @objc dynamic var favorites: [Int] {
        guard let array = array(forKey: "favorite_movies") as? [Int] else { return [] }
        
        return array
    }
    
}
