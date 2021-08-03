class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchSearchMovies(
        category: MovieCategoryViewModel,
        completion: @escaping (Result<[MovieSearchModel], Error>) -> Void
    ) {
        repository.fetchMovies(category: .popular, subcategory: .action) {
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
        category: MovieCategoryViewModel,
        subcategory: SubcategoryViewModel,
        completion: @escaping (Result<[MovieModel], Error>) -> Void
    ) {
        guard
            let category = MovieCategoryModel(from: category),
            let subcategory = SubcategoryModel(from: subcategory)
        else {
            return
        }
        
        repository.fetchMovies(category: category, subcategory: subcategory) {
            (result: Result<[MovieRepositoryModel], Error>)  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let useCasePosterModels: [MovieModel] = value.map { model -> MovieModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MovieModel(
                        id: model.id,
                        imageUrl: imageUrl,
                        isSelected: false,
                        genreIds: model.genreIds)
                }
                var filteredValue = [MovieModel]()
                switch category {
                case .popular, .topRated:
                    filteredValue = useCasePosterModels.filter({
                        $0.genreIds.contains(subcategory)
                    })
                default:
                    filteredValue = useCasePosterModels
                }
                completion(.success(filteredValue))
            }
        }
    }
    
}


