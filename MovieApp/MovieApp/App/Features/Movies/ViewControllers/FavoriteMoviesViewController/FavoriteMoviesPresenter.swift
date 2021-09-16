import UIKit
import Combine

class FavoriteMoviesPresenter {

    private let moviesUseCase: MoviesUseCaseProtocol

    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }

    var favoriteMovies: AnyPublisher<[MovieViewModel], Never> {
        moviesUseCase
            .favoriteMovies
            .map { $0.map { MovieViewModel(from: $0) } }
            .receiveOnMain()
    }

}
