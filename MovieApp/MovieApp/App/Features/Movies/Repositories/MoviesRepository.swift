import Combine

class MoviesRepository: MoviesRepositoryProtocol {
    
    var favoriteMovies = [MovieRepositoryModel]()
    
    private let networkDataSource: MoviesNetworkDataSourceProtocol
    
    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    ) {
        guard
            let categoryRepoModel = MovieCategoryRepositoryModel(from: categoryModel),
            let subcategoryRepoModel = SubcategoryRepositoryModel(from: subcategoryModel)
        else {
            return
        }
        
        networkDataSource.fetchMovies(
            categoryRepositoryModel: categoryRepoModel,
            subcategoryRepositoryModel: subcategoryRepoModel
        ) {
            (result: Result<[MovieDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let repositoryModels: [MovieRepositoryModel] = value.map {
                    MovieRepositoryModel(from: $0)
                }
                completion(.success(repositoryModels))
            }
        }
    }

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsRepositoryModel, Error> {
        networkDataSource
            .fetchMovie(with: id)
            .map { MovieDetailsRepositoryModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchCast(
        with id: Int,
        completion: @escaping (Result<[CastRepositoryModel], Error>) -> Void
    ) {
        networkDataSource.fetchCast(with: id) { (result: Result<[CastDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let castRepositoryModels = model.map {
                    CastRepositoryModel(from: $0)
                }
                completion(.success(castRepositoryModels))
            }
        }
    }
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorRepositoryModel], Error>) -> Void
    ) {
        networkDataSource.fetchActors(with: id) { (result: Result<[ActorDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let actorsRepositoryModels = model.map {
                    ActorRepositoryModel(from: $0)
                }
                completion(.success(actorsRepositoryModels))
            }
        }
    }
    
    func fetchReviews(
        with id: Int,
        completion: @escaping (Result<[ReviewRepositoryModel], Error>) -> Void
    ) {
        networkDataSource.fetchReviews(with: id) { (result: Result<[ReviewDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let reviewsRepositoryModels = model.map {
                    ReviewRepositoryModel(from: $0)
                }
                completion(.success(reviewsRepositoryModels))
            }
        }
    }
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationRepositoryModel], Error>) -> Void
    ) {
        networkDataSource.fetchRecommendations(with: id) { (result: Result<[RecommendationDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let recommendationsRepositoryModels = model.map {
                    RecommendationRepositoryModel(from: $0)
                }
                completion(.success(recommendationsRepositoryModels))
            }
        }
    }
    
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    ) {
        networkDataSource.fetchSearchMovies(with: query) { (result: Result<[MovieDataSourceModel], Error>) in
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieRepositoryModels = value.map {
                    MovieRepositoryModel(from: $0)
                }
                completion(.success(movieRepositoryModels))
            }
        }
    }
    
}
