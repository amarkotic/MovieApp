struct ReviewModel {
    
    let author: AuthorModel
    let content: String
    let createdAt: String?
    
    init(from repositoryModel: ReviewRepositoryModel) {
        author = AuthorModel(from: repositoryModel.author)
        content = repositoryModel.content
        createdAt = repositoryModel.createdAt
    }
    
}

struct AuthorModel {
    
    let username: String
    let avatarPath: String?
    
    init(from repositoryModel: AuthorRepositoryModel) {
        username = repositoryModel.username
        if let path = repositoryModel.avatarPath?.dropFirst() {
            avatarPath = String(path)
        } else {
            avatarPath = ""
        }
    }
    
}
