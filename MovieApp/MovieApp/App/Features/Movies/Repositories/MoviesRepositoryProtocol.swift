protocol MoviesRepositoryProtocol {
    
    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    )
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsRepositoryModel, Error>) -> Void
    )
    
    func fetchCast(
        with id: Int,
        completion: @escaping (Result<[CastRepositoryModel], Error>) -> Void
    )
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorRepositoryModel], Error>) -> Void
    )
    
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
