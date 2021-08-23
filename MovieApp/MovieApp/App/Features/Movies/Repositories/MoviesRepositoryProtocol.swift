import Combine

protocol MoviesRepositoryProtocol {
    
    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )
    
    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsRepositoryModel, Error> 
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsRepositoryModel, Error> 
    
    func fetchReviews(
        with id: Int,
        completion: @escaping (Result<[ReviewRepositoryModel], Error>) -> Void
    )
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationRepositoryModel], Error>) -> Void
    )
    
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )
    
}
