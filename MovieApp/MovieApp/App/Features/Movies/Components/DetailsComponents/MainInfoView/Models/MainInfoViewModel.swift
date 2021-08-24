struct MainInfoViewModel {
    
    let posterPath: String
    let progressPercentage: Float
    let movieName: String
    let releaseDate: String
    let language: String
    let genres: String
    let duration: Int
    let isFavorite: Bool
    
    init(from model: MovieDetailsModel) {
        posterPath = model.posterPath
        progressPercentage = model.voteAverage
        movieName = model.title
        releaseDate = model.releaseDate
        language = model.language
        genres = model.genres.map { "\($0.name)" }.joined(separator: ", ")
        duration = model.runtime
        isFavorite = model.isFavorited
    }
    
}
