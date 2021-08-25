import UIKit
import Alamofire
import Combine

class MoviesSearchPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    private let appRouter: AppRouter
    
    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchViewModel], Error> {
        moviesUseCase
            .fetchSearchMovies(with: query)
            .compactMap { $0.compactMap { MovieSearchViewModel(from: $0) } }
            .receiveOnMain()
    }
    
    init(moviesUseCase: MoviesUseCaseProtocol, appRouter: AppRouter) {
        self.moviesUseCase = moviesUseCase
        self.appRouter = appRouter
    }
    
    func popViewController() {
        appRouter.popWithoutAnimation()
    }
    
}
