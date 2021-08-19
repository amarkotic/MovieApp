struct MovieDetailsDataSourceModel {

    let id: Int
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresDataSourceModel]
    let overview: String
    
    init(from networkModel: MovieDetailsNetworkModel) {
        id = networkModel.id
        posterPath = NetworkConstants.imagePath + networkModel.posterPath
        voteAverage = networkModel.voteAverage
        title = networkModel.title
        releaseDate = networkModel.releaseDate
        runtime = networkModel.runtime
        language = networkModel.language
        self.genres = networkModel.genres.map { GenresDataSourceModel(from: $0) }
        overview = networkModel.overview
    }
    
}

struct GenresDataSourceModel {
    
    let id: Int
    let name: String
    
    init(from networkModel: GenresNetworkModel) {
        self.id = networkModel.id
        self.name = networkModel.name
    }
    
}
