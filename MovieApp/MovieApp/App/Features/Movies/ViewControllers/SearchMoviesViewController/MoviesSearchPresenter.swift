import UIKit
import Alamofire

class MoviesSearchPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    private let appRouter: AppRouter
    weak private var moviesViewDelegate: MoviesSearchViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol, appRouter: AppRouter) {
        self.moviesUseCase = moviesUseCase
        self.appRouter = appRouter
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesSearchViewController?) {
        self.moviesViewDelegate = moviesViewDelegate
    }
    
    func fetchMovies() {
        moviesUseCase.fetchSearchMovies(category: .popular) { [weak self] (result: Result<[MovieSearchModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels: [MovieSearchViewModel] = value.map { model -> MovieSearchViewModel in
                    return MovieSearchViewModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description)
                }
                self?.moviesViewDelegate?.fetchSuccesful(movies: viewModels)
            }
        }
    }
    
    func popViewController() {
        appRouter.popWithoutAnimation()
    }
    
}
