import UIKit
import Combine
import Resolver

class DetailsPresenter {

    private var identifier: Int!
    @Injected private var appRouter: AppRouter
    @Injected private var movieUseCase: MoviesUseCaseProtocol

    var info: AnyPublisher<InfoViewModel, Error> {
        movieUseCase
            .fetchMovie(with: identifier)
            .map { InfoViewModel(from: $0) }
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
                 MovieDetailsViewModel(
                    info: $0.0,
                    credits: $0.1,
                    reviews: $0.2,
                    recommendations: $0.3
                )
            }
            .receiveOnMain()
    }

    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }

    func updateFavoriteMovie(with url: String) {
        movieUseCase
            .updateFavorites(id: identifier, with: url)
    }

    func setIdentifier(with identifier: Int) {
        self.identifier = identifier
    }

}
