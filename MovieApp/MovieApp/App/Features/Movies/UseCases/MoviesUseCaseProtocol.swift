protocol MoviesUseCaseProtocol {
    
    var favoriteItems: [Int] { get }
    
    func fetchMovies(
        categoryViewModel: MovieCategoryViewModel,
        subcategoryViewModel: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    )
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsModel, Error>) -> Void
    )
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorModel], Error>) -> Void
    )
    
    func fetchReview(
        with id: Int,
        completion: @escaping (Result<ReviewModel, Error>) -> Void
    )
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationModel], Error>) -> Void
    )
    
    func updateFavorites(with id: Int)
    
    func fetchFavoriteMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void)
    
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    ) 
}
