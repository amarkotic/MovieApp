class MoviesRepository: MoviesRepositoryProtocol {
    
    private let networkDataSource: MoviesNetworkDataSourceProtocol
    
    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<[MovieRepositoryModel], NetworkError>) -> Void) {
        networkDataSource.fetchMovies { (result: NetworkResult<[MovieDataSourceModel], NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let repositoryModel: [MovieRepositoryModel] = value.map { model -> MovieRepositoryModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MovieRepositoryModel(
                        imageUrl: imageUrl,
                        title: model.title,
                        description: model.description)
                }
                completion(.success(repositoryModel))
            }
        }
    }
    
}
