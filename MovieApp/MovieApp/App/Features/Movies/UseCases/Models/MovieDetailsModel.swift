struct MovieDetailsModel {
    
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresModel]
    let overview: String
    
}

struct GenresModel {
    
    let id: Int
    let name: String
    
    init(from genresRepositoryModel: GenresRepositoryModel) {
        id = genresRepositoryModel.id
        name = genresRepositoryModel.name
    }
    
}
