import UIKit
import Alamofire

class NetworkService {
    
    private let URL = "https://api.themoviedb.org/3/movie/popular?api_key=e24dd8d2f3822e3917d10c6570d7f574&language=en-US"
    
    func fetchMovies<T: Codable>(completion: @escaping (Result<T, ApiError>) -> Void) {
        let request = AF.request(URL)
        request.responseJSON { [weak self] (data) in
            
            guard let self = self else {
                completion(.failure(.clientError))
                return
            }
                
            if let dataError = data.error {
                completion(.failure(self.mapError(error: dataError)))
                return
            }
            
            guard let data = data.data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(T.self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(.dataDecodingError))
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
