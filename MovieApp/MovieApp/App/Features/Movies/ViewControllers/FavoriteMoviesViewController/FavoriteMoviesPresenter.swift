import UIKit

class FavoriteMoviesPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    
    var data = [MovieViewModel]()
    weak private var delegate: FavoriteMoviesViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setDelegate(delegate: FavoriteMoviesViewController?) {
        self.delegate = delegate
    }
    
    func fetchMovies() {
        var temporaryArray = [MovieViewModel]()
        moviesUseCase.favoriteItems.forEach { [weak self] id in
            guard let self = self else { return }
            
            moviesUseCase.fetchMovie(with: id) { (result: Result<MovieDetailsModel, Error>) in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let value):
                    temporaryArray.append(MovieViewModel(id: id, imageUrl: value.posterPath, isFavorite: true))
                    self.data = temporaryArray
                    self.delegate?.reloadData()
                }
            }
        }
    }
    
}
