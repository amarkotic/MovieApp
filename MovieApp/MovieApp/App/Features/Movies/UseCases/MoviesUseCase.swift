class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchSearchMovies(category: CategoryEnum, completion: @escaping (Result<[MovieSearchModel], Error>) -> Void) {
        repository.fetchMovies(category: .popular, subcategory: .action) { (result: Result<[MovieRepositoryModel], Error>) in
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
    
    func fetchMovies(category: CategoryEnum, subcategory: SubcategoryEnum, completion: @escaping (Result<[MovieModel], Error>) -> Void) {
        repository.fetchMovies(category: category, subcategory: subcategory) { (result: Result<[MovieRepositoryModel], Error>)  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                
                var filteredValue = [MovieRepositoryModel]()
                
                switch subcategory {
                case .today, .thisWeek:
                    filteredValue = value
                default:
                    filteredValue = value.filter({
                        $0.genreIds.contains(subcategory.integerValue)
                    })
                }
                let useCasePosterModels: [MovieModel] = filteredValue.map { model -> MovieModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MovieModel(
                        id: model.id,
                        imageUrl: imageUrl,
                        isSelected: false)
                }
                completion(.success(useCasePosterModels))
            }
        }
    }
    
}


