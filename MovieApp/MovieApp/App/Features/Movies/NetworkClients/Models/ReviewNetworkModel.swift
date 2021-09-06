struct ReviewsNetworkModel: Codable {

    let results: [ReviewNetworkModel]

}

struct ReviewNetworkModel: Codable {

    let author: AuthorNetworkModel
    let content: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case author = "author_details"
        case content = "content"
        case createdAt = "created_at"
    }

}

struct AuthorNetworkModel: Codable {

    let username: String
    let avatarPath: String?

    enum CodingKeys: String, CodingKey {
        case username = "username"
        case avatarPath = "avatar_path"
    }

}
