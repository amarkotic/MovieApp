import UIKit

struct MovieDetailsNetworkModel: Codable {
    
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let genres: [GenresNetworkModel]
    let overview: String

    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case title = "original_title"
        case releaseDate = "release_date"
        case genres = "genres"

        case overview = "overview"
    }
    
}

struct GenresNetworkModel: Codable {
    
    let name: String
    
}
