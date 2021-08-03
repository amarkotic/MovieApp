enum SubcategoryModel: Int, Codable {
    
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
    
    var genreId: Int {
        switch self {
        case .action:
            return 28
        case .adventure:
            return 12
        case .comedy:
            return 35
        case .drama:
            return 18
        case .family:
            return 10751
        case .horror:
            return 27
        case .romance:
            return 10749
        case .thriller:
            return 53
        case .scienceFiction:
            return 878
        default:
            return 0
        }
    }

    init?(from model: SubcategoryViewModel) {
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
