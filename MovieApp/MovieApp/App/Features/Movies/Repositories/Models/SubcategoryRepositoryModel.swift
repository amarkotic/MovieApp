enum SubcategoryRepositoryModel: Int {
    
    case action
    case adventure
    case comedy
    case drama
    case family
    case horror
    case romance
    case thriller
    case scienceFiction
    case today
    case thisWeek
    
    init?(from model: SubcategoryModel) {
        switch model {
        case .action:
            self = .action
        case .adventure:
            self = .adventure
        case .comedy:
            self = .comedy
        case .drama:
            self = .drama
        case .family:
            self = .family
        case .horror:
            self = .horror
        case .romance:
            self = .romance
        case .thriller:
            self = .thriller
        case .scienceFiction:
            self = .scienceFiction
        case .today:
            self = .today
        case .thisWeek:
            self = .thisWeek
        }
    }

    init?(from model: SubcategoryDataSourceModel) {
        switch model {
        case .action:
            self = .action
        case .adventure:
            self = .adventure
        case .comedy:
            self = .comedy
        case .drama:
            self = .drama
        case .family:
            self = .family
        case .horror:
            self = .horror
        case .romance:
            self = .romance
        case .thriller:
            self = .thriller
        case .scienceFiction:
            self = .scienceFiction
        case .today:
            self = .today
        case .thisWeek:
            self = .thisWeek
        }
    }
    
}
