struct MovieDetailsViewModel {
    
    let info: MainInfoViewModel
    let overview: OverviewViewModel
    let actors: [ActorViewModel]?
    
    let recommendations = [
        RecommendationsViewModel(imageName: "lovepuppy", title: "Iron man 1"),
        RecommendationsViewModel(imageName: "lovepuppy", title: "Iron man 1"),
        RecommendationsViewModel(imageName: "lovepuppy", title: "Iron man 1"),
        RecommendationsViewModel(imageName: "lovepuppy", title: "Iron man 1")
    ]
    
}
