import UIKit
import Combine
import Resolver

class FavoriteMoviesPresenter {

    @Injected private var moviesUseCase: MoviesUseCaseProtocol

    var favoriteMovies: AnyPublisher<[MovieViewModel], Never> {
        moviesUseCase
            .favoriteMovies
            .map { $0.map { MovieViewModel(from: $0) } }
            .receiveOnMain()
    }

}
