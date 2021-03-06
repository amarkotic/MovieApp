import Foundation
import Combine

class MoviesNetworkClient: MoviesNetworkClientProtocol {

    func getMovies(
        categoryDataSourceModel: MovieCategoryDataSourceModel,
        subcategoryDataSourceModel: SubcategoryDataSourceModel
    ) -> AnyPublisher<MoviesNetworkModel, Error> {
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
        guard let url = url else { return .empty() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MoviesNetworkModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getMovie(with id: Int) -> AnyPublisher<MovieDetailsNetworkModel, Error> {
        guard let url = EndpointConstant.movie(id: id).url else { return .empty() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieDetailsNetworkModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getCredits(with id: Int) -> AnyPublisher<CreditsNetworkModel, Error> {
        guard let url = EndpointConstant.credits(id: id).url else { return .empty() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CreditsNetworkModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getReviews(with id: Int) -> AnyPublisher<ReviewsNetworkModel, Error> {
        guard let url = EndpointConstant.reviews(id: id).url else { return .empty() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ReviewsNetworkModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getRecommendations(with id: Int) -> AnyPublisher<RecommendationsNetworkModel, Error> {
        guard let url = EndpointConstant.recommendations(id: id).url else { return .empty() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RecommendationsNetworkModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getSearchMovies(with query: String) -> AnyPublisher<MoviesNetworkModel, Error> {
        guard let url = EndpointConstant.searchMovie(with: query).url else { return .empty() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MoviesNetworkModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
