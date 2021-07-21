import UIKit
import Alamofire

class MoviesPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    weak private var moviesViewDelegate: MoviesViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesViewController?) {
        self.moviesViewDelegate = moviesViewDelegate
    }
    
    func fetchMovies() {
        moviesUseCase.fetchMovies { [weak self] (result: NetworkResult<[MovieModel], NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels: [MovieViewModel] = value.map { model -> MovieViewModel in
                    return MovieViewModel(
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description)
                }
                self?.moviesViewDelegate?.fetchSuccesful(movies: viewModels)
            }
        }
    }
    
}
