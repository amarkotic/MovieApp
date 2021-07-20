import Foundation

struct Endpoint {
    
    let path: String
    let queryItems: [URLQueryItem]
    
}

extension Endpoint {
    
    static var endpoint: Endpoint {
        return Endpoint(path: "/3/movie/popular",
                        queryItems: [
                            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
                            URLQueryItem(name: "language", value: NetworkConstants.language)
                        ]
        )
    }
    
}

extension Endpoint {
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
}
