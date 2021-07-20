protocol RepositoryProtocol{
    
    func fetchMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) 
    
}
