import UIKit

class DetailsPresenter {
    
    private let appRouter: AppRouter
    var movieUseCase: MoviesUseCaseProtocol!
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
                let viewModels: [ActorViewModel] = value.map { actorModel in
                    ActorViewModel(nameLabel: actorModel.name,
                                   roleLabel: actorModel.character,
                                   posterPath: actorModel.profilePath ?? "")
                }
                self.delegate?.setCastData(model: viewModels)
            }
        }
        
        movieUseCase.fetchReview(with: id) { (result: Result<ReviewModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                
                let viewModel = SocialViewModel(
                    author: value.author,
                    date: value.createdAt,
                    review: value.content)
                self.delegate?.setReviewData(model: viewModel)
            }
        }
        
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
}
