import UIKit
import Alamofire

class MoviesViewPresenter {

    private let networkService: NetworkServiceProtocol
    weak private var moviesViewDelegate: MoviesViewController?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesViewController?) {
        self.moviesViewDelegate = moviesViewDelegate
    }

    func fetchMovies() {
        networkService.get { [weak self] (result: NetworkResult<MoviesNetworkModel, NetworkError>) in
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
