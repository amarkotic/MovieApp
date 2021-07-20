import Foundation

class MoviesNetworkClient {
    
    let parameters = Endpoint.endpoint
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        
        guard let url = parameters.url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
}
