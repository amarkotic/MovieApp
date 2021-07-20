class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        repository.fetchMovies(completion: completion)
    }
    
}


