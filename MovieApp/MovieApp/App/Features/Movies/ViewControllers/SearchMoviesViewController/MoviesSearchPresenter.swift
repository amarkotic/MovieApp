import UIKit
import Combine
import Resolver

class MoviesSearchPresenter {

    @Injected private var moviesUseCase: MoviesUseCaseProtocol
    @Injected private var appRouter: AppRouter

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
