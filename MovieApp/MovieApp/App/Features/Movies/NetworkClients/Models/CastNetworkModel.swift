import UIKit

struct WholeCastNetworkModel: Codable {
    
    let crew: [CastNetworkModel]
    
}

struct CastNetworkModel: Codable {
    
    let deparment: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case deparment = "known_for_department"
        case name = "name"
    }
    
}
