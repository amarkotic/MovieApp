import UIKit

struct MoviesNetworkModel: Codable {
    
    let results: [MovieNetworkModel]
    
}

struct MovieNetworkModel: Codable {
    
    let identifier: Int
    let imageUrl: String
    let title: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case imageUrl = "poster_path"
        case title = "original_title"
        case description = "overview"
    }
    
}
