struct MovieDetailsDataSourceModel {
    
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresDataSourceModel]
    let overview: String
    
}

struct GenresDataSourceModel: Codable {
    
    let id: Int
    let name: String
    
    init(from networkModel: GenresNetworkModel) {
        self.id = networkModel.id
        self.name = networkModel.name
    }
    
}
