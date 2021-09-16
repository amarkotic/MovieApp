import UIKit
import Combine

class MoviesSearchPresenter {

    private let moviesUseCase: MoviesUseCaseProtocol
    private let appRouter: AppRouter

    init(moviesUseCase: MoviesUseCaseProtocol, appRouter: AppRouter) {
        self.moviesUseCase = moviesUseCase
        self.appRouter = appRouter
    }

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchViewModel], Error> {
        moviesUseCase
            .fetchSearchMovies(with: query)
            .map { $0.map { MovieSearchViewModel(from: $0) } }
            .receiveOnMain()
    }

    func popViewController() {
        appRouter.popWithoutAnimation()
    }

}
