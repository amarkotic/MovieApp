import UIKit

struct ActorsNetworkModel: Codable {
    
    let cast: [ActorNetworkModel]
    
}

struct ActorNetworkModel: Codable {
    
    let deparment: String
    let name: String
    let profilePath: String?
    let character: String

    enum CodingKeys: String, CodingKey {
        case deparment = "known_for_department"
        case name = "name"
        case profilePath = "profile_path"
        case character = "character"
    }
    
}
