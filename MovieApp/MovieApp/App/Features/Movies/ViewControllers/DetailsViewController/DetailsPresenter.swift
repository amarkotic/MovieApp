import UIKit
import Combine

class DetailsPresenter {
    
    private let appRouter: AppRouter
    private let movieUseCase: MoviesUseCaseProtocol
    weak private var delegate: DetailsViewController?
    private let identifier: Int
    
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
    
    var detailsData: AnyPublisher<MovieDetailsViewModel, Error> {
        Publishers
            .CombineLatest(info, credits)
            .map { info, credits in
                MovieDetailsViewModel(
                    info: info,
                    credits: credits
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
