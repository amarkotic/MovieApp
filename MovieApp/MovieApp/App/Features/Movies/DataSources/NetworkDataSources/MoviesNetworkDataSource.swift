import Combine

class MoviesNetworkDataSource: MoviesNetworkDataSourceProtocol {
    
    private let networkClient: MoviesNetworkClientProtocol
    
    init(networkClient: MoviesNetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) {
        guard
            let categoryDataSourceModel = MovieCategoryDataSourceModel(from: categoryRepositoryModel),
            let subcategoryDataSourceModel = SubcategoryDataSourceModel(from: subcategoryRepositoryModel)
        else {
            return
        }
        
        networkClient.getMovies(
            categoryDataSourceModel: categoryDataSourceModel,
            subcategoryDataSourceModel: subcategoryDataSourceModel
        ) {
            (result: Result<MoviesNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDataSourceModels: [MovieDataSourceModel] = value.results.map {
                    return MovieDataSourceModel(from: $0)
                }
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsDataSourceModel, Error> {
        networkClient
            .getMovie(with: id)
            .map { MovieDetailsDataSourceModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsDataSourceModel, Error> {
        networkClient
            .getCredits(with: id)
            .map { CreditsDataSourceModel(from: $0) }
            .eraseToAnyPublisher()
    }
    
    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewDataSourceModel], Error> {
        networkClient
            .getReviews(with: id)
            .map { $0.results.map { ReviewDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }
    
    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationDataSourceModel], Error> {
        networkClient
            .getRecommendations(with: id)
            .map { $0.results.map { RecommendationDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }
    
    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieDataSourceModel], Error> {
        networkClient
            .getSearchMovies(with: query)
            .map { $0.results.map { MovieDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }
    
}
