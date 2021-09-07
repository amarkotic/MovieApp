import UIKit

class DetailsPresenter {
    
    private let appRouter: AppRouter
    private let movieUseCase: MoviesUseCaseProtocol
    weak private var delegate: DetailsViewController?
    private let identifier: Int
    
    init(movieUseCase: MoviesUseCaseProtocol, router: AppRouter, identifier: Int) {
        self.movieUseCase = movieUseCase
        self.appRouter = router
        self.identifier = identifier
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData() {
        movieUseCase.fetchMovie(with: identifier) { [weak self]
            (result: Result<MovieDetailsModel, Error>) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                var genres = String()
                value.genres.forEach {
                    genres.append($0.name)
                    genres.append(" ")
                }
                
                let savedMovieIds = self.movieUseCase.oldFavoriteItems
                let isSaved = savedMovieIds.contains(self.identifier)
                let viewModel = MovieDetailsViewModel(
                    info: MainInfoViewModel(
                        posterPath: value.posterPath,
                        progressPercentage: value.voteAverage,
                        movieName: value.title,
                        releaseDate: value.releaseDate,
                        language: value.language,
                        genres: genres,
                        duration: value.runtime,
                        isFavorite: isSaved
                        ),
                    overview: OverviewViewModel(
                        overview: value.overview),
                    actors: nil
                )
                self.delegate?.setMainInfoData(model: viewModel)
            }
        }
        
        movieUseCase.fetchActors(with: identifier) {
            (result: Result<[ActorModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels: [ActorViewModel] = value.map {
                    ActorViewModel(from: $0)
                }
                self.delegate?.setActorsData(model: viewModels)
            }
        }
        
        movieUseCase.fetchCast(with: identifier) {
            (result: Result<[CastModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels = value.map {
                    CastViewModel(from: $0)
                }
                self.delegate?.setCastData(model: viewModels)
            }
        }
        
        movieUseCase.fetchReview(with: identifier) { [weak self]
            (result: Result<ReviewModel, CustomError>) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.hideReview()
            case .success(let value):
                let viewModel = SocialViewModel(from: value)
                self.delegate?.setReviewData(model: viewModel)
            }
        }
        
        movieUseCase.fetchRecommendations(with: identifier) {
            (result: Result<[RecommendationModel], Error>) in
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
    
    func updateFavoriteMovie() {
        movieUseCase
            .updateFavorites(with: identifier)
        fetchData()
    }
    
}
