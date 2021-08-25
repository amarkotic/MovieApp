import UIKit
import Combine

class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let moviesRepository: MoviesRepositoryProtocol
    private let userDefaultsRepository: UserDefaultsRepositoryProtocol
    
    var favoriteMovies: AnyPublisher<[FavoriteMovieModel], Never> {
        userDefaultsRepository
            .favoriteItems
            .setFailureType(to: Error.self)
            .flatMap { [weak self] ids -> AnyPublisher<[MovieDetailsRepositoryModel], Error> in
                guard let self = self else { return .never() }
                
                let movieStreams = ids.map {
                    self.moviesRepository.fetchMovie(with: $0)
                }
                return Publishers.MergeMany(movieStreams)
                    .collect()
                    .eraseToAnyPublisher()
            }
            .assertNoFailure()
            .map { $0.map { FavoriteMovieModel(id: $0.id, imageUrl: $0.posterPath, isSelected: true) } }
            .eraseToAnyPublisher()
    }
    
    var oldFavoriteItems: [Int] {
        userDefaultsRepository
            .oldFavoriteItems
    }
    
    init(
        moviesRepository: MoviesRepositoryProtocol,
        userDefaultsRepository: UserDefaultsRepositoryProtocol
    ) {
        self.moviesRepository = moviesRepository
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func fetchMovies(
        categoryViewModel: MovieCategoryViewModel,
        subcategoryViewModel: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    ) {
        guard
            let subcategoryModel = SubcategoryModel(from: subcategoryViewModel),
            let categoryModel = MovieCategoryModel(from: categoryViewModel)
        else {
            return
        }
        
        moviesRepository.fetchMovies(categoryModel: categoryModel, subcategoryModel: subcategoryModel) {
            (result: Result<[MovieRepositoryModel], Error>)  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let repoModels):
                let useCaseModels: [MovieModel] = repoModels.map { [weak self] model -> MovieModel in
                    let subcategoryModels = model.subcategories.compactMap { SubcategoryModel(rawValue: $0.rawValue) }
                    let savedMovieIds = self?.userDefaultsRepository.oldFavoriteItems
                    let isSaved = savedMovieIds!.contains(model.id)
                    return MovieModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        isSelected: isSaved,
                        subcategories: subcategoryModels)
                }
                var filteredValue = [MovieModel]()
                switch categoryViewModel {
                case .popular, .topRated:
                    filteredValue = useCaseModels.filter({
                        $0.subcategories.contains(subcategoryModel)
                    })
                default:
                    filteredValue = useCaseModels
                }
                completion(.success(filteredValue))
            }
        }
    }
    
    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsModel, Error> {
        let favoriteIdsPublisher = userDefaultsRepository
            .favoriteItems
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        
        return moviesRepository
            .fetchMovie(with: id)
            .combineLatest(favoriteIdsPublisher)
            .map {
                let isSelected = $0.1.contains(id)
                return  MovieDetailsModel(from: $0.0, isSelected: isSelected)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsModel, Error> {
        moviesRepository
            .fetchCredits(with: id)
            .map { CreditsModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewModel], Error> {
        moviesRepository
            .fetchReviews(with: id)
            .map { $0.map { ReviewModel(from: $0) } }
            .eraseToAnyPublisher()
    }
    
    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationModel], Error> {
        moviesRepository
            .fetchRecommendations(with: id)
            .map { $0.map { RecommendationModel(from: $0) } }
            .eraseToAnyPublisher()
    }
    
    func updateFavorites(with id: Int) {
        userDefaultsRepository
            .updateFavorites(with: id)
    }
    
    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchModel], Error> {
        moviesRepository
            .fetchSearchMovies(with: query)
            .map { $0.map { MovieSearchModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
