import Foundation

class MoviesNetworkClient: MoviesNetworkClientProtocol {
    
    private let networkService: NetworkServiceProtocol
    var url: URL!
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getMovies(category: CategoryEnum,
                   subcategory: SubcategoryDataSourceModel,
                   completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void) {
        guard let subcategory = SubcategoryDataSourceModel(rawValue: subcategory.rawValue) else { return }
        
        switch category {
        case .popular:
            url = EndpointConstant.popularMovies.url
        case .topRated:
            url = EndpointConstant.topRatedMovies.url
        case .trending:
            switch subcategory {
            case .thisWeek:
                url = EndpointConstant.trendingMoviesThisWeek.url
            default:
                url = EndpointConstant.trendingMoviesToday.url
            }
        }
        guard let url = url else { return }
        
        networkService.get(url: url, completion: completion)
    }
    
}
