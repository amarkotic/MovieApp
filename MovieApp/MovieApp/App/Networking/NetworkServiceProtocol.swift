import Foundation

protocol NetworkServiceProtocol {

    func get<T: Codable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void)

}
