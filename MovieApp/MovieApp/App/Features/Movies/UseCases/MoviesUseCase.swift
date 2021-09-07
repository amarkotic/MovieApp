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
                    self.moviesRepository.fetchfavoriteMovie(with: $0)
                }
                return Publishers.MergeMany(movieStreams)
                    .collect()
                    .eraseToAnyPublisher()
            }
            .replaceError(with: [])
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
        
        moviesRepository.fetchMovies(
            categoryModel: categoryModel,
            subcategoryModel: subcategoryModel
        ) { [weak self] (result: Result<[MovieRepositoryModel], Error>)  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let repoModels):
                let useCaseModels: [MovieModel] = repoModels.map { model -> MovieModel in
                    let subcategoryModels = model.subcategories.compactMap { SubcategoryModel(rawValue: $0.rawValue) }
                    let savedMovieIds = self?.userDefaultsRepository.oldFavoriteItems
                    let isSaved = savedMovieIds?.contains(model.id) ?? false
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
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsModel, Error>) -> Void
    ) {
        moviesRepository.fetchMovie(with: id) {
            (result: Result<MovieDetailsRepositoryModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDetailsModels: MovieDetailsModel = MovieDetailsModel(from: value)
                completion(.success(movieDetailsModels))
            }
        }
    }
    
    func fetchCast(
        with id: Int,
        completion: @escaping (Result<[CastModel], Error>) -> Void
    ) {
        moviesRepository.fetchCast(with: id) { (result: Result<[CastRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let castModel = model.map {
                    CastModel(from: $0)
                }
                completion(.success(Array(castModel.prefix(6))))
            }
        }
    }
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorModel], Error>) -> Void
    ) {
        moviesRepository.fetchActors(with: id) { (result: Result<[ActorRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let actorsModels = model.map {
                    ActorModel(from: $0)
                }
                let actors = actorsModels.filter { model in
                    model.deparment.elementsEqual(CastKeys.acting.rawValue)
                }
                completion(.success(Array(actors.prefix(10))))
            }
        }
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
