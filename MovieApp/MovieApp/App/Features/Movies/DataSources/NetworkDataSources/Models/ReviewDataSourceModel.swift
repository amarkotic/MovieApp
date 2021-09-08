struct ReviewDataSourceModel {

    let author: AuthorDataSourceModel
    let content: String
    let createdAt: String?

    init(from networkModel: ReviewNetworkModel) {
        author = AuthorDataSourceModel(from: networkModel.author)
        content = networkModel.content
        createdAt = networkModel.createdAt
    }

}

struct AuthorDataSourceModel {

    let username: String
    let avatarPath: String?

    init(from networkModel: AuthorNetworkModel) {
        username = networkModel.username
        avatarPath = networkModel.avatarPath
    }

}
