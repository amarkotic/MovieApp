import UIKit

struct MovieDetailsNetworkModel: Codable {

    let id: Int
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresNetworkModel]
    let overview: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case title = "original_title"
        case releaseDate = "release_date"
        case runtime = "runtime"
        case language = "original_language"
        case genres = "genres"
        case overview = "overview"
    }

}

struct GenresNetworkModel: Codable {

    let id: Int
    let name: String

}
