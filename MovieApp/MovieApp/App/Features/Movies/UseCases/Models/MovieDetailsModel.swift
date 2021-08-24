struct MovieDetailsModel {
    
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresModel]
    let overview: String
    let isFavorited: Bool
    
    init(from repositoryModel: MovieDetailsRepositoryModel, isSelected: Bool) {
        posterPath = NetworkConstants.imagePath + repositoryModel.posterPath
        voteAverage = repositoryModel.voteAverage * 10
        title = repositoryModel.title
        releaseDate = repositoryModel.releaseDate
        runtime = repositoryModel.runtime
        language = repositoryModel.language
        self.genres = repositoryModel.genres.map { GenresModel(from: $0) }
        overview = repositoryModel.overview
        isFavorited = isSelected
    }
}

struct GenresModel {
    
    let id: Int
    let name: String
    
    init(from genresRepositoryModel: GenresRepositoryModel) {
        id = genresRepositoryModel.id
        name = genresRepositoryModel.name
    }
    
}
