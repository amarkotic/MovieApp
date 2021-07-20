class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        repository.fetchMovies(completion: completion)
    }
    
}


