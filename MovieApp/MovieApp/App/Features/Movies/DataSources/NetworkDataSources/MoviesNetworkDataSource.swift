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

    func fetchReviews(
        with id: Int,
        completion: @escaping (Result<[ReviewDataSourceModel], Error>) -> Void
    ) {
        
        networkClient.getReviews(with: id) { (result: Result<ReviewsNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let reviewDataSourceModels = model.results.map {
                    ReviewDataSourceModel(from: $0)
                }
                completion(.success(reviewDataSourceModels))
            }
        }
    }
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationDataSourceModel], Error>) -> Void
    ) {
        
        networkClient.getRecommendations(with: id) { (result: Result<RecommendationsNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let recommendationsDataSourceModels = model.results.map {
                    RecommendationDataSourceModel(from: $0)
                }
                completion(.success(recommendationsDataSourceModels))
            }
        }
    }
    
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) 	{
        networkClient.getSearchMovies(with: query) {
            (result: Result<MoviesNetworkModel, NetworkError>) in
            switch result {
            case .failure(_):
                print("Invalid query")
            case .success(let value):
                let movieDataSourceModels = value.results.map {
                    return MovieDataSourceModel(from: $0)
                }
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
}
