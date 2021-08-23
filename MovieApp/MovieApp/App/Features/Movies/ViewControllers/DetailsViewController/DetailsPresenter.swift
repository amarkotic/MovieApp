import UIKit
import Combine

class DetailsPresenter {
    
    private let appRouter: AppRouter
    private let movieUseCase: MoviesUseCaseProtocol
    weak private var delegate: DetailsViewController?
    private let identifier: Int
    
    var mainInfo: AnyPublisher<MainInfoViewModel, Error> {
        movieUseCase
            .fetchMovie(with: identifier)
            .map { MainInfoViewModel(from: $0, isSaved: true) }
            .receiveOnMain()
    }
    
    var overview: AnyPublisher<OverviewViewModel, Error> {
        movieUseCase.fetchMovie(with: identifier)
            .map { OverviewViewModel(from: $0) }
            .receiveOnMain()
    }
    
    var detailsData: AnyPublisher<MovieDetailsViewModel, Error> {
        Publishers
            .CombineLatest(mainInfo, overview)
            .map { info, overview in
                MovieDetailsViewModel(
                    info: info,
                    overview: overview
                )
            }
            .eraseToAnyPublisher()
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
