enum RealmCategory: String {

    case popular
    case topRated
    case trending

    init(from model: MovieCategoryRepositoryModel) {
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
