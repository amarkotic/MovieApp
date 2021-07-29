class MoviesRepository: MoviesRepositoryProtocol {
    
    private let networkDataSource: MoviesNetworkDataSourceProtocol
    
    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void) {
        networkDataSource.fetchMovies { (result: Result<[MovieDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let repositoryModels: [MovieRepositoryModel] = value.map { model -> MovieRepositoryModel in
                    return MovieRepositoryModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description)
                }
                completion(.success(repositoryModels))
            }
        }
    }
    
}
