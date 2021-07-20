import Foundation

class MoviesNetworkClient {
    
    private let popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?api_key=e24dd8d2f3822e3917d10c6570d7f574&language=en-US"
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getMovies(completion: @escaping (NetworkResult<MoviesNetworkModel, NetworkError>) -> Void) {
        networkService.get(url: popularMoviesUrl, completion: completion)
    }
    
}
