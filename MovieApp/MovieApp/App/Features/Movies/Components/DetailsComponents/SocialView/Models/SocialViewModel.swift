struct SocialViewModel {
    
    let author: AuthorViewModel
    let date: String?
    let review: String
    
    init(from reviewModel: ReviewModel) {
        author = AuthorViewModel(from: reviewModel.author)
        date = reviewModel.createdAt
        review = reviewModel.content
    }
    
}

struct AuthorViewModel {
    
    let username: String
    let avatarPath: String?
    
    init(from model: AuthorModel) {
        username = model.username
        avatarPath = model.avatarPath
    }
    
}
