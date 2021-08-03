enum SubcategoryModel: Int, Codable {
    
    case action = 28
    case adventure = 12
    case comedy = 35
    case drama = 18
    case family = 10751
    case horror = 27
    case romance = 10749
    case thriller = 53
    case scienceFiction = 878
    case today
    case thisWeek

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
