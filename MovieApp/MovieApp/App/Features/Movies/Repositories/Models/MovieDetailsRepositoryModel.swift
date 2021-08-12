struct MovieDetailsRepositoryModel {
    
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresNetworkModel]
    let overview: String

}
