protocol NetworkServiceProtocol {
    
    func get<T: Codable>(completion: @escaping (NetworkResult<T, NetworkError>) -> Void)
    
}
