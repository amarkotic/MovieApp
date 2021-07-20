import Foundation

class MoviesNetworkClient {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        guard let url = EndpointConstant.popularMovies.url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
}
