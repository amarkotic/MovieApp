struct ReviewRepositoryModel: Codable {
    
    let author: String
    let content: String
    let createdAt: String
    
    init(from dataSourceModel: ReviewDataSourceModel) {
        author = dataSourceModel.author
        content = dataSourceModel.content
        createdAt = dataSourceModel.createdAt
    }
    
}
