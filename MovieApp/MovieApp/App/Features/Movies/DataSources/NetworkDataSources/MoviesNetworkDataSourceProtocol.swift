import Combine

protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) 
    
    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsDataSourceModel, Error>
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsDataSourceModel, Error>
    
    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewDataSourceModel], Error> 
    
    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationDataSourceModel], Error>
    
    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieDataSourceModel], Error>
    
}
