struct InfoViewModel {
    
    var mainInfoModel: MainInfoViewModel
    var overviewModel: OverviewViewModel
    
    init(from model: MovieDetailsModel, isSaved: Bool) {
        mainInfoModel = MainInfoViewModel(from: model, isSaved: isSaved)
        overviewModel = OverviewViewModel(from: model)
    }
    
}
