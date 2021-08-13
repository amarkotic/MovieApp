struct ReviewsNetworkModel: Codable {
    
    let results: [ReviewNetworkModel]
    
}

struct ReviewNetworkModel: Codable {
    
    let author: String
    let content: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case createdAt = "created_at"
    }
    
}
