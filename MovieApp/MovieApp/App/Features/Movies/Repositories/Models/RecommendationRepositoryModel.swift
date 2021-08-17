struct RecommendationRepositoryModel {
    
    let title: String
    let posterPath: String
    
    init(from dataSourceModel: RecommendationDataSourceModel) {
        title = dataSourceModel.title
        posterPath = dataSourceModel.posterPath
    }
    
}
