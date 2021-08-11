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
        moviesUseCase.fetchMovies(categoryViewModel: .popular, subcategoryViewModel: .action) { [weak self] (result: Result<[MovieModel], Error>) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let viewModels: [MovieViewModel] = value.map { model -> MovieViewModel in
                    return MovieViewModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        isFavorite: false
                    )
                }
                self.data = viewModels
                self.delegate?.reloadData()
            }
        }
    }
    
}
