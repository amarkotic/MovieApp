protocol MoviesNetworkClientProtocol {
    
    func getMovies(category: CategoryEnum, completion: @escaping (Result<MoviesNetworkModel, NetworkError>) -> Void)

}
