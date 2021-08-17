class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let moviesRepository: MoviesRepositoryProtocol
    private let userDefaultsRepository: UserDefaultsRepositoryProtocol
    
    var favoriteItems: [Int] {
        userDefaultsRepository
            .favoriteItems
    }
    
    init(
        moviesRepository: MoviesRepositoryProtocol,
        userDefaultsRepository: UserDefaultsRepositoryProtocol
    ) {
        self.moviesRepository = moviesRepository
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func fetchSearchMovies(
        category: MovieCategoryViewModel,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    ) {
        moviesRepository.fetchMovies(categoryModel: .popular, subcategoryModel: .action) {
            (result: Result<[MovieRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let useCaseSearchModels: [MovieSearchModel] = value.map { model -> MovieSearchModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MovieSearchModel(
                        id: model.id,
                        imageUrl: imageUrl,
                        title: model.title,
                        description: model.description)
                }
                completion(.success(useCaseSearchModels))
            }
        }
    }
    
    func fetchMovies(
        categoryViewModel: MovieCategoryViewModel,
        subcategoryViewModel: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    ) {
        guard
            let subcategoryModel = SubcategoryModel(from: subcategoryViewModel),
            let categoryModel = MovieCategoryModel(from: categoryViewModel)
        else {
            return
        }
        
        moviesRepository.fetchMovies(categoryModel: categoryModel, subcategoryModel: subcategoryModel) {
            (result: Result<[MovieRepositoryModel], Error>)  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let repoModels):
                let useCaseModels: [MovieModel] = repoModels.map { [weak self] model -> MovieModel in
                    let subcategoryModels = model.subcategories.compactMap { SubcategoryModel(rawValue: $0.rawValue) }
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    let savedMovieIds = self?.userDefaultsRepository.favoriteItems
                    let isSaved = savedMovieIds!.contains(model.id)
                    return MovieModel(
                        id: model.id,
                        imageUrl: imageUrl,
                        isSelected: isSaved,
                        subcategories: subcategoryModels)
                }
                var filteredValue = [MovieModel]()
                switch categoryViewModel {
                case .popular, .topRated:
                    filteredValue = useCaseModels.filter({
                        $0.subcategories.contains(subcategoryModel)
                    })
                default:
                    filteredValue = useCaseModels
                }
                completion(.success(filteredValue))
            }
        }
    }
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsModel, Error>) -> Void
    ) {
        moviesRepository.fetchMovie(with: id) {
            (result: Result<MovieDetailsRepositoryModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDetailsModels: MovieDetailsModel = MovieDetailsModel(from: value)
                completion(.success(movieDetailsModels))
            }
        }
    }
    
    func fetchActors(
        with id: Int,
        completion: @escaping (Result<[ActorModel], Error>) -> Void
    ) {
        moviesRepository.fetchActors(with: id) { (result: Result<[ActorRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let actorsModels = model.map {
                    ActorModel(from: $0)
                }
                let actors = actorsModels.filter { model in
                    model.deparment.elementsEqual(CastKeys.acting.rawValue)
                }
                completion(.success(Array(actors.prefix(10))))
            }
        }
    }
    
    func fetchReview(
        with id: Int,
        completion: @escaping (Result<ReviewModel, Error>) -> Void
    ) {
        moviesRepository.fetchReviews(with: id) { (result: Result<[ReviewRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let reviewModels = model.map {
                    return ReviewModel(from: $0)
                }
                guard let review = reviewModels.first else { return }
                
                completion(.success(review))     
            }
        }
    }
    
    func fetchRecommendations(
        with id: Int,
        completion: @escaping (Result<[RecommendationModel], Error>) -> Void
    ) {
        moviesRepository.fetchRecommendations(with: id) { (result: Result<[RecommendationRepositoryModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let model):
                let recommendationsModels = model.map {
                    RecommendationModel(from: $0)
                }
                completion(.success(recommendationsModels))
            }
        }
    }
    
    func updateFavorites(with id: Int) {
        userDefaultsRepository
            .updateFavorites(with: id)
    }
    
}
