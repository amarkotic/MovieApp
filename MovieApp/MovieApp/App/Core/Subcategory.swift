enum SubcategoryEnum: String {
    
    case action = "Action"
    case adventure = "Adventure"
    case comedy = "Comedy"
    case drama = "Drama"
    case family = "Family"
    case horror = "Horror"
    case romance = "Romance"
    case thriller = "Thriller"
    case scienceFiction = "Science fiction"
    case today = "Today"
    case thisWeek = "This week"
    
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
    
}
