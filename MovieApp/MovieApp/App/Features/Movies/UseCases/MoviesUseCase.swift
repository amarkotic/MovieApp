class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<[MovieModel], NetworkError>) -> Void) {
        repository.fetchMovies { (result: NetworkResult<[MovieRepositoryModel], NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let useCaseModel: [MovieModel] = value.map { model -> MovieModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MovieModel(
                        imageUrl: imageUrl,
                        title: model.title,
                        description: model.description)
                }
                completion(.success(useCaseModel))
            }
        }
    }
    
}


