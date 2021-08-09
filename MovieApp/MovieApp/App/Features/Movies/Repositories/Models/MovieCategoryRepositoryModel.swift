enum MovieCategoryRepositoryModel {
    
    case popular
    case topRated
    case trending
    
    init?(from model: MovieCategoryModel) {
        switch model {
        case .popular:
            self = .popular
        case .topRated:
            self = .topRated
        case .trending:
            self = .trending
        }
    }
    
}
