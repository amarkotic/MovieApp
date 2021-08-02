import UIKit

class HomePresenter {
    
    private let moviesUseCase: MoviesUseCaseProtocol
    
    var data = [CategoryViewModel(
                    title: .popular,
                    categories: [.action, .adventure, .comedy, .drama, .family, .horror, .romance, .thriller, .scienceFiction],
                    movies: []),
                CategoryViewModel(
                    title: .topRated,
                    categories: [.action, .adventure, .comedy, .drama, .family, .horror, .romance, .thriller, .scienceFiction],
                    movies:  []),
                CategoryViewModel(
                    title: .trending,
                    categories: [.today, .thisWeek],
                    movies:  [])
    ]
    
    weak private var delegate: HomeViewController?
    
    init(moviesUseCase: MoviesUseCaseProtocol) {
        self.moviesUseCase = moviesUseCase
    }
    
    func setDelegate(delegate: HomeViewController?) {
        self.delegate = delegate
    }
    
    func fetchMovies(category: CategoryEnum, subCategory: SubcategoryViewModel) {
        moviesUseCase.fetchMovies(category: category, subcategory: subCategory) { [weak self] (result: Result<[MovieModel], Error>) in
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
                switch category {
                case .popular:
                    self.data[0].movies = viewModels
                case .topRated:
                    self.data[1].movies = viewModels
                case .trending:
                    self.data[2].movies = viewModels
                }
                self.delegate?.reloadData()
            }
        }
    }
    
    func initialFetch() {
        fetchMovies(category: .popular, subCategory: .action)
        fetchMovies(category: .topRated, subCategory: .action)
        fetchMovies(category: .trending, subCategory: .today)
    }
    
}
