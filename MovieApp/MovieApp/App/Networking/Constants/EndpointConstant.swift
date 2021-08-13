import Foundation

struct EndpointConstant {
    
    let path: String
    let queryItems: [URLQueryItem]
    
}

extension EndpointConstant {
    
    static var popularMovies: EndpointConstant {
        EndpointConstant(path: "/3/movie/popular",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
                            URLQueryItem(name: "language", value: NetworkConstants.language)
                         ]
        )
    }
    
    static var topRatedMovies: EndpointConstant {
        EndpointConstant(path: "/3/movie/top_rated",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
                            URLQueryItem(name: "language", value: NetworkConstants.language)
                         ]
        )
    }
    
    static var trendingMoviesToday: EndpointConstant {
        EndpointConstant(path: "/3/trending/movie/day",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey)
                         ]
        )
    }
    
    static var trendingMoviesThisWeek: EndpointConstant {
        EndpointConstant(path: "/3/trending/movie/week",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey)
                         ]
        )
    }
    
    static func movie(id: Int) -> EndpointConstant {
        EndpointConstant(path: "/3/movie/\(id)",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey)
                         ]
        )
    }
    
    static func actors(id: Int) -> EndpointConstant {
        EndpointConstant(path: "/3/movie/\(id)/credits",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey)
                         ]
        )
    }
    
    static func reviews(id: Int) -> EndpointConstant {
        EndpointConstant(path: "/3/movie/\(id)/reviews",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey)
                         ]
        )
    }
    
    static func recommendations(id: Int) -> EndpointConstant {
        EndpointConstant(path: "/3/movie/\(id)/recommendations",
                         queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey)
                         ]
        )
    }

}

extension EndpointConstant {
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
}
