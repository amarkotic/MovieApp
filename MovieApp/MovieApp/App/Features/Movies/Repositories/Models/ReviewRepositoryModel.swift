struct ReviewRepositoryModel {

    let author: AuthorRepositoryModel
    let content: String
    let createdAt: String?

    init(from dataSourceModel: ReviewDataSourceModel) {
        author = AuthorRepositoryModel(from: dataSourceModel.author)
        content = dataSourceModel.content
        createdAt = dataSourceModel.createdAt
    }

}

struct AuthorRepositoryModel {

    let username: String
    let avatarPath: String?

    init(from dataSourceModel: AuthorDataSourceModel) {
        username = dataSourceModel.username
        avatarPath = dataSourceModel.avatarPath
    }

}
