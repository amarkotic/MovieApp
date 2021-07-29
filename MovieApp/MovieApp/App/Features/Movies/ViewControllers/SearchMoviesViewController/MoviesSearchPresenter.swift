import UIKit
import Alamofire

class MoviesSearchPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    weak private var moviesViewDelegate: MoviesSearchViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesSearchViewController?) {
        self.moviesViewDelegate = moviesViewDelegate
    }
    
    func fetchMovies() {
        moviesUseCase.fetchMovies { [weak self] (result: Result<[MovieModel], Error>) in
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
    
}
