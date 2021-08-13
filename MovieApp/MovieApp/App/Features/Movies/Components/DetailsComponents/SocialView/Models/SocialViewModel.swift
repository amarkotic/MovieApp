struct SocialViewModel {
    
    let author: String
    let date: String
    let review: String?
    
    init(from reviewModel: ReviewModel) {
        author = reviewModel.author
        date = reviewModel.createdAt ?? ""
        review = reviewModel.content
    }
    
}
