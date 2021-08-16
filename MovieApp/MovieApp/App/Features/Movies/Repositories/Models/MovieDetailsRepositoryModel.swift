struct MovieDetailsRepositoryModel {
    
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresRepositoryModel]
    let overview: String

    init(from dataSourceModel: MovieDetailsDataSourceModel) {
        posterPath = dataSourceModel.posterPath
        voteAverage = dataSourceModel.voteAverage
        title = dataSourceModel.title
        releaseDate = dataSourceModel.releaseDate
        runtime = dataSourceModel.runtime
        language = dataSourceModel.language
        self.genres = dataSourceModel.genres.map { GenresRepositoryModel(from: $0) }
        overview = dataSourceModel.overview
    }

}

struct GenresRepositoryModel {
    
    let id: Int
    let name: String
    
    init(from dataSourceModel: GenresDataSourceModel) {
        id = dataSourceModel.id
        name = dataSourceModel.name
    }
    
}
