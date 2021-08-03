enum MovieCategoryNetworkModel {
    
    case popular
    case topRated
    case trending
    
    init?(from model: MovieCategoryDataSourceModel) {
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
