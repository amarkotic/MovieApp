class MoviesNetworkDataSource: MoviesNetworkDataSourceProtocol {
    
    private let networkClient: MoviesNetworkClientProtocol
    
    init(networkClient: MoviesNetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<[MovieDataSourceModel], NetworkError>) -> Void) {
        networkClient.getMovies { (result: NetworkResult<MoviesNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDataSourceModel: [MovieDataSourceModel] = value.results.map { model -> MovieDataSourceModel in
                    return MovieDataSourceModel(
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description)
                }
                completion(.success(movieDataSourceModel))
            }
        }
    }
    
}
