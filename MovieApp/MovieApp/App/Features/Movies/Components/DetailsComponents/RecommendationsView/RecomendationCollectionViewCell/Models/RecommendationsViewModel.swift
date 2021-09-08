struct RecommendationsViewModel {

    let imageName: String
    let title: String

    init(from model: RecommendationModel) {
        imageName = model.posterPath
        title = model.title
    }

}
