import UIKit
import Alamofire

class MoviesViewPresenter {

    private let moviesUseCase: MoviesUseCaseProtocol
    weak private var moviesViewDelegate: MoviesViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesViewController?) {
        self.moviesViewDelegate = moviesViewDelegate
    }

    func fetchMovies() {
        moviesUseCase.fetchMovies { [weak self] (result: NetworkResult<MoviesNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels = value.results.map { MovieViewModel(with: $0) }
                self?.moviesViewDelegate?.fetchSuccesful(movies: viewModels)
            }
        }
    }
    
}
