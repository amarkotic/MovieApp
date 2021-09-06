struct OverviewViewModel {

    let overview: String

    init(from model: MovieDetailsModel) {
        overview = model.overview
    }
}
