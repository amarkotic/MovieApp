import UIKit
import Alamofire

class NetworkService {
    
    
    let URL = "https://api.themoviedb.org/3/movie/popular?api_key=e24dd8d2f3822e3917d10c6570d7f574&language=en-US"
    typealias AlamofireResponse = ([Movie]?, ApiError?) -> Void
    
    func fetchMovies(completion: @escaping AlamofireResponse) {
        let request = AF.request(URL)
        request.responseJSON { [weak self] (data) in
            
            guard let self = self else {
                completion(nil, .clientError)
                return
            }
                
            if let dataError = data.error {
                completion(nil, self.mapError(error: dataError))
            }
            
            guard let data = data.data else {
                completion(nil, .noData)
                return
            }
            
            do{
                let movies = try JSONDecoder().decode(Movies.self, from: data)
                completion(movies.results, nil)
            }catch {
                completion(nil, .dataDecodingError)
            }
        }
    }

}
extension NetworkService {
    private func mapError(error: AFError) -> ApiError {
        switch error {
        case .createURLRequestFailed(error: _), .invalidURL(url: _), .urlRequestValidationFailed(reason: _):
            return .clientError
        case .serverTrustEvaluationFailed(reason: _):
            return .serverError
        default:
            return .general
        }
    }
}
