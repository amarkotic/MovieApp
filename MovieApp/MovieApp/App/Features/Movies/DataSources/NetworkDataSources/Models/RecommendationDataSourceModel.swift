struct RecommendationDataSourceModel {

    let title: String
    let posterPath: String

    init(from networkModel: RecommendationNetworkModel) {
        title = networkModel.title
        posterPath = networkModel.posterPath
    }

}
