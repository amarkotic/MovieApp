struct RecommendationModel {
    
    let title: String
    let posterPath: String
    
    init(from repositoryModel: RecommendationRepositoryModel) {
        title = repositoryModel.title
        posterPath = NetworkConstants.imagePath + repositoryModel.posterPath
    }
     
}
