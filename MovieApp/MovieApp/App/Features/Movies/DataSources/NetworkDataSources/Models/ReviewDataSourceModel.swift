struct ReviewDataSourceModel: Codable {
    
    let author: String
    let content: String
    let createdAt: String
    
    init(from networkModel: ReviewNetworkModel) {
        author = networkModel.author
        content = networkModel.content
        createdAt = networkModel.createdAt
    }
    
}
