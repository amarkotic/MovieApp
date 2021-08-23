import Combine

protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) 

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsDataSourceModel, Error>
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsDataSourceModel, Error>
    
    func fetchReviews(
        with id: Int,
        completion: @escaping (Result<[ReviewDataSourceModel], Error>) -> Void
    )
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationDataSourceModel], Error>) -> Void
    )
    
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    )
    
}
