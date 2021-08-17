import UIKit

class DetailsPresenter {
    
    private let appRouter: AppRouter
    private let movieUseCase: MoviesUseCaseProtocol
    weak private var delegate: DetailsViewController?
    
    init(movieUseCase: MoviesUseCaseProtocol, router: AppRouter) {
        self.movieUseCase = movieUseCase
        appRouter = router
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData(with id: Int) {
        movieUseCase.fetchMovie(with: id) {
            (result: Result<MovieDetailsModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                var genres = String()
                value.genres.forEach {
                    genres.append($0.name)
                    genres.append(" ")
                }
              
                let viewModel = MovieDetailsViewModel(
                    info: MainInfoViewModel(
                        posterPath: value.posterPath,
                        progressPercentage: value.voteAverage,
                        movieName: value.title,
                        releaseDate: value.releaseDate,
                        language: value.language,
                        genres: genres,
                        duration: value.runtime),
                    overview: OverviewViewModel(
                        overview: value.overview),
                    actors: nil
                )
                self.delegate?.setMainInfoData(model: viewModel)
            }
        }
        
        movieUseCase.fetchActors(with: id) { (result: Result<[ActorModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels: [ActorViewModel] = value.map {
                    ActorViewModel(from: $0)
                }
                self.delegate?.setCastData(model: viewModels)
            }
        }
        
        movieUseCase.fetchReview(with: id) { (result: Result<ReviewModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModel = SocialViewModel(from: value)
                self.delegate?.setReviewData(model: viewModel)
            }
        }

        movieUseCase.fetchRecommendations(with: id) { (result: Result<[RecommendationModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                
                let viewModels: [RecommendationsViewModel] = value.map {
                    RecommendationsViewModel(imageName: $0.posterPath, title: $0.title)
                }
                self.delegate?.setRecommendationsData(model: viewModels)
            }
        }
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
}
