import UIKit
import Alamofire

class MoviesViewPresenter {

    private let moviesNetworkService: MoviesNetworkClient
    weak private var moviesViewDelegate: MoviesViewController?
    
    init(moviesNetworkService: MoviesNetworkClient) {
        self.moviesNetworkService = moviesNetworkService
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesViewController?) {
        self.moviesViewDelegate = moviesViewDelegate
    }

    func fetchMovies() {
        moviesNetworkService.getMovies { [weak self] (result: NetworkResult<MoviesNetworkModel, NetworkError>) in
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
