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
    
    func fetchCredits(with id: Int) -> AnyPublisher<CreditsModel, Error>
    
    func fetchReviews(with id: Int) -> AnyPublisher<[ReviewModel], Error>
    
    func fetchRecommendations(with id: Int) -> AnyPublisher<[RecommendationModel], Error> 
    
    func updateFavorites(with id: Int)
   
    func fetchSearchMovies(with query: String) -> AnyPublisher<[MovieSearchModel], Error>
    
}
