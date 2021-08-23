import Combine

protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) 

    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsDataSourceModel, Error>
    
    func fetchCast(
        with id: Int,
        completion: @escaping (Result<[CastDataSourceModel], Error>) -> Void
    )
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorDataSourceModel], Error>) -> Void
    )
    
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
