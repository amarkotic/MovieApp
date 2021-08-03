import UIKit

struct MoviesNetworkModel: Codable {
    
    let results: [MovieNetworkModel]
    
}

struct MovieNetworkModel: Codable {
    
    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let genreIds: [SubcategoryNetworkModel]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageUrl = "poster_path"
        case title = "original_title"
        case description = "overview"
        case genreIds = "genre_ids"
        
    }
    
}
