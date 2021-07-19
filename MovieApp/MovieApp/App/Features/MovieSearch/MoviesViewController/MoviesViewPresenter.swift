import UIKit
import Alamofire

class MoviesViewPresenter {

    private let networkService: NetworkService
    weak private var moviesViewDelegate: MoviesViewController?
    
    init(networkService: NetworkService){
        self.networkService = networkService
    }
    
    func setMoviesViewDelegate(moviesViewDelegate: MoviesViewController?){
        self.moviesViewDelegate = moviesViewDelegate
    }

    func fetchMovies() {
        networkService.fetchMovies { [weak self] (result: Result<Movies, ApiError>) in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                self?.moviesViewDelegate?.fetchSuccesful(movies: value.results)
            }
            
        }
    }
    
}
