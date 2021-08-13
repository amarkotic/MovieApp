struct ReviewModel: Codable {
    
    let author: String
    let content: String
    let createdAt: String
    
    init(from repositoryModel: ReviewRepositoryModel) {
        author = repositoryModel.author
        content = repositoryModel.content
        createdAt = repositoryModel.createdAt
    }
    
}
