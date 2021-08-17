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
                let movieDataSourceModels: [MovieDataSourceModel] = value.results.map { model -> MovieDataSourceModel in
                    let subcategoryDataSourceModels = model.genreIds.compactMap {
                        SubcategoryDataSourceModel(rawValue: $0)
                    }
                    return MovieDataSourceModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description,
                        subcategories: subcategoryDataSourceModels)
                }
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsDataSourceModel, Error>) -> Void
    ) {
        networkClient.getMovie(with: id) {
            (result: Result<MovieDetailsNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDataSourceModels = MovieDetailsDataSourceModel(from: value)
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorDataSourceModel], Error>) -> Void
    ) {
        networkClient.getActors(with: id) { (result: Result<ActorsNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let actorsDataSourceModels = model.cast.map {
                    ActorDataSourceModel(from: $0)
                }
                completion(.success(actorsDataSourceModels))
            }
        }
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

}
