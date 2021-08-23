struct InfoViewModel {
    
    var mainInfoModel: MainInfoViewModel
    var overviewModel: OverviewViewModel
    
    init(from model: MovieDetailsModel) {
        mainInfoModel = MainInfoViewModel(from: model, isSaved: true)
        overviewModel = OverviewViewModel(from: model)
    }
}
