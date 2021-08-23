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
        moviesRepository
            .fetchMovie(with: id)
            .map { MovieDetailsModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsModel, Error> {
        moviesRepository
            .fetchCredits(with: id)
            .map { CreditsModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchActors(with id: Int) -> AnyPublisher<[ActorModel], Error> {
        moviesRepository
            .fetchCredits(with: id)
            .map { model in
                model.actors.map {ActorModel(from: $0) }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchCast(with id: Int) -> AnyPublisher<[CastModel], Error> {
        moviesRepository.fetchCredits(with: id)
            .map { model in
                model.cast.map { CastModel(from: $0) }
            }
            .eraseToAnyPublisher()
    }

    func fetchReview(
        with id: Int,
        completion: @escaping (Result<ReviewModel, CustomError>) -> Void
    ) {
        moviesRepository.fetchReviews(with: id) { (result: Result<[ReviewRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let reviewModels = model.map {
                    return ReviewModel(from: $0)
                }
                guard
                    let review = reviewModels.first
                else {
                    completion(.failure(.noReview))
                    return
                }
                
                completion(.success(review))
            }
        }
    }
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationModel], Error>) -> Void
    ) {
        moviesRepository.fetchRecommendations(with: id) { (result: Result<[RecommendationRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let recommendationsModels = model.map {
                    RecommendationModel(from: $0)
                }
                completion(.success(recommendationsModels))
            }
        }
    }
    
    func updateFavorites(with id: Int) {
        userDefaultsRepository
            .updateFavorites(with: id)
    }
    
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    ) {
        moviesRepository.fetchSearchMovies(with: query) { (result: Result<[MovieRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieModels = value.map {
                    MovieSearchModel(from: $0)
                }
                completion(.success(movieModels))
            }
        }
    }
    
}
