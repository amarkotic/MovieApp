import UIKit

struct CreditsNetworkModel: Codable {

    let actors: [ActorNetworkModel]
    let crew: [CastNetworkModel]

    enum CodingKeys: String, CodingKey {
        case actors = "cast"
        case crew = "crew"
    }

}

struct CastNetworkModel: Codable {

    let deparment: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case deparment = "known_for_department"
        case name = "name"
    }

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
