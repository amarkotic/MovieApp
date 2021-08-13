struct MovieDetailsRepositoryModel {
    
    let posterPath: String
    let voteAverage: Float
    let title: String
    let releaseDate: String
    let runtime: Int
    let language: String
    let genres: [GenresRepositoryModel]
    let overview: String

}

struct GenresRepositoryModel {
    
    let id: Int
    let name: String
    
    init(from dataSourceModel: GenresDataSourceModel) {
        id = dataSourceModel.id
        name = dataSourceModel.name
    }
    
}
