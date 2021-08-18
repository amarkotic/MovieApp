import UIKit
import Alamofire

class MoviesSearchPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    private let appRouter: AppRouter
    weak private var delegate: MoviesSearchViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol, appRouter: AppRouter) {
        self.moviesUseCase = moviesUseCase
        self.appRouter = appRouter
    }
    
    func setDelegate(delegate: MoviesSearchViewController?) {
        self.delegate = delegate
    }
    
    func fetchMovies(with query: String) {
        moviesUseCase.fetchSearchMovies(with: query) { [weak self]
            (result: Result<[MovieSearchModel], Error>)  in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieSearchViewModel = value.map {
                    MovieSearchViewModel(from: $0)
                }
                guard let delegate = self.delegate else { return }
                
                delegate.fetchSuccesful(movies: movieSearchViewModel)
            }
        }
    }
    
    func popViewController() {
        appRouter.popWithoutAnimation()
    }
    
}
