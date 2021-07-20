import Foundation

protocol NetworkServiceProtocol {
    
    func get<T: Codable>(url: URL, completion: @escaping (NetworkResult<T, NetworkError>) -> Void)
    
}
