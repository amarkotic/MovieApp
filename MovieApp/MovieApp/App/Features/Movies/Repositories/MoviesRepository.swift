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
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsRepositoryModel, Error> {
        networkDataSource
            .fetchCredits(with: id)
            .map { CreditsRepositoryModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewRepositoryModel], Error> {
        networkDataSource
            .fetchReviews(with: id)
            .map { $0.map { ReviewRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }
    
    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationRepositoryModel], Error> {
        networkDataSource
            .fetchRecommendations(with: id)
            .map { $0.map { RecommendationRepositoryModel(from: $0) } }
            .eraseToAnyPublisher() 
    }

    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieRepositoryModel], Error> {
        networkDataSource
            .fetchSearchMovies(with: query)
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
