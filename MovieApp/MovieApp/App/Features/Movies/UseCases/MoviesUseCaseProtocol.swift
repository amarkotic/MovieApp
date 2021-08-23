import Combine

protocol MoviesUseCaseProtocol {
    
    var favoriteMovies: AnyPublisher<[FavoriteMovieModel], Never> { get }
    
    var oldFavoriteItems: [Int] { get }
    
    func fetchMovies(
        categoryViewModel: MovieCategoryViewModel,
        subcategoryViewModel: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    )
    
    func fetchMovie(with id: Int) -> AnyPublisher<MovieDetailsModel, Error>
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorModel], Error>) -> Void
    )
    
    func fetchReview(
        with id: Int,
        completion: @escaping (Result<ReviewModel, CustomError>) -> Void
    )
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationModel], Error>) -> Void
    )
    
    func updateFavorites(with id: Int)
   
    func fetchSearchMovies(
        with query: String,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    )
    
    func fetchCast(
        with id: Int,
        completion: @escaping (Result<[CastModel], Error>) -> Void
    ) 
    
}
