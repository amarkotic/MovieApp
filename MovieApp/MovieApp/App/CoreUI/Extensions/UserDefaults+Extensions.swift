import Foundation

extension UserDefaults {
    
    @objc dynamic var favorites: [Int] {
        guard let array = array(forKey: "favorites") as? [Int] else { return [] }
        
        return array
    }
    
}
