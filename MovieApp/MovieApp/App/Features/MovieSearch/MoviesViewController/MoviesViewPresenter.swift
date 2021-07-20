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
                let viewModels = value.results.map { model -> MovieViewModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MovieViewModel(
                        imageUrl: imageUrl,
                        title: model.title,
                        description: model.description)
                }
                self?.moviesViewDelegate?.fetchSuccesful(movies: viewModels)
            }
        }
    }
    
}
