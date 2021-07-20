protocol NetworkServiceProtocol {
    
    func get<T: Codable>(url: String, completion: @escaping (NetworkResult<T, NetworkError>) -> Void)
    
}
