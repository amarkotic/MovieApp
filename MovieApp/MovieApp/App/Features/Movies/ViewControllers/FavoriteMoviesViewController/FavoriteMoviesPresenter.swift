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
        moviesUseCase.fetchFavoriteMovies { (result: Result<[MovieModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                self.data = value.map {
                    MovieViewModel(
                        id: $0.id,
                        imageUrl: $0.imageUrl,
                        isFavorite: $0.isSelected
                    )
                } 
                self.delegate?.reloadData()
            }
        }
    }
    
}
