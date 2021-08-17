import Foundation

class MoviesNetworkClient: MoviesNetworkClientProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getMovies(
        categoryDataSourceModel: MovieCategoryDataSourceModel,
        subcategoryDataSourceModel: SubcategoryDataSourceModel,
        completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void
    ) {
        var url: URL?
        switch categoryDataSourceModel {
        case .popular:
            url = EndpointConstant.popularMovies.url
        case .topRated:
            url = EndpointConstant.topRatedMovies.url
        case .trending:
            switch subcategoryDataSourceModel {
            case .thisWeek:
                url = EndpointConstant.trendingMoviesThisWeek.url
            default:
                url = EndpointConstant.trendingMoviesToday.url
            }
        }
        guard let url = url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
    func getMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsNetworkModel, NetworkError>) -> Void
    ) {
        var url: URL?
        url = EndpointConstant.movie(id: id).url
        guard let url = url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
    func getActors(
        with id: Int,
        completion: @escaping (Result<ActorsNetworkModel, NetworkError>) -> Void
    ) {
        var url: URL?
        url = EndpointConstant.actors(id: id).url
        guard let url = url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
    func getReviews(
        with id: Int,
        completion: @escaping (Result<ReviewsNetworkModel, NetworkError>) -> Void
    ) {
        var url: URL?
        url = EndpointConstant.reviews(id: id).url
        guard let url = url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
    func getRecommendations(
        with id: Int,
        completion: @escaping (Result<RecommendationsNetworkModel, NetworkError>) -> Void
    ) {
        var url: URL?
        url = EndpointConstant.recommendations(id: id).url
        guard let url = url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
}
