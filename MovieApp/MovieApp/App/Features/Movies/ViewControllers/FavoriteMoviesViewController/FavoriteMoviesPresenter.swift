import UIKit
import Combine

class FavoriteMoviesPresenter {

    private let moviesUseCase: MoviesUseCaseProtocol

    var favoriteMovies: AnyPublisher<[MovieViewModel], Never> {
        moviesUseCase
            .favoriteMovies
            .map { $0.map { MovieViewModel(from: $0) } }
            .receiveOnMain()
    }

    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }

}
