struct RecommendationsNetworkModel: Codable {

    let results: [RecommendationNetworkModel]

}

struct RecommendationNetworkModel: Codable {

    let title: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case posterPath = "poster_path"
    }

}
