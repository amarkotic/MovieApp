import UIKit
import Combine

class FavoriteMoviesPresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    
    var data = [MovieViewModel]()
    
    var favoriteMovies: AnyPublisher<[MovieViewModel], Never> {
        moviesUseCase
            .favoriteMovies
            .map { $0.map { MovieViewModel(from: $0) } }
            .receiveOnMain()
    }
    
    weak private var delegate: FavoriteMoviesViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setDelegate(delegate: FavoriteMoviesViewController?) {
        self.delegate = delegate
    }
    
}
