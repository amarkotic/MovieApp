import UIKit
import Combine

class DetailsPresenter {
    
    private let appRouter: AppRouter
    private let movieUseCase: MoviesUseCaseProtocol
    weak private var delegate: DetailsViewController?
    private let identifier: Int
    
    var info: AnyPublisher<InfoViewModel, Error> {
        let isSaved = movieUseCase.oldFavoriteItems.contains(identifier)
      
        return movieUseCase
            .fetchMovie(with: identifier)
            .map { InfoViewModel(from: $0, isSaved: isSaved) }
            .receiveOnMain()
    }
    
    var credits: AnyPublisher<CreditsViewModel, Error> {
        movieUseCase
            .fetchCredits(with: identifier)
            .map { CreditsViewModel(from: $0) }
            .receiveOnMain()
    }
    
    var reviews: AnyPublisher<[SocialViewModel], Error> {
        movieUseCase
            .fetchReviews(with: identifier)
            .map { $0.map {SocialViewModel(from: $0) } }
            .receiveOnMain()
    }
    
    var recommendations: AnyPublisher<[RecommendationsViewModel], Error> {
        movieUseCase
            .fetchRecommendations(with: identifier)
            .map { $0.map { RecommendationsViewModel(from: $0) } }
            .receiveOnMain()
    }
    
    var detailsData: AnyPublisher<MovieDetailsViewModel, Error> {
        Publishers
            .CombineLatest4(info, credits, reviews, recommendations)
            .map {
                 return MovieDetailsViewModel(
                    info: $0.0,
                    credits: $0.1,
                    reviews: $0.2,
                    recommendations: $0.3
                )
            }
            .receiveOnMain()
    }
    
    init(movieUseCase: MoviesUseCaseProtocol, router: AppRouter, identifier: Int) {
        self.movieUseCase = movieUseCase
        self.appRouter = router
        self.identifier = identifier
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
    func updateFavoriteMovie() {
        movieUseCase
            .updateFavorites(with: identifier)
    }
    
}
