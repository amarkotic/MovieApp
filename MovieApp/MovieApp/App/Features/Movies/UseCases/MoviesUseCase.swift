class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchSearchMovies(category: CategoryEnum, completion: @escaping (Result<[MovieSearchModel], Error>) -> Void) {
        repository.fetchMovies(category: .popular) { (result: Result<[MovieRepositoryModel], Error>) in
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
    
    func fetchPosterMovies(category: CategoryEnum, subcategory: SubcategoryEnum, completion: @escaping (Result<[MoviePosterModel], Error>) -> Void) {
        repository.fetchMovies(category: category) { (result: Result<[MovieRepositoryModel], Error>)  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                var genreValue = [MovieRepositoryModel]()
                switch subcategory {
                case .action:
                    value.forEach { model in
                        if model.genreIds.contains(28) {
                            genreValue.append(model)
                        }
                    }
                case .adventure:
                    value.forEach { model in
                        if model.genreIds.contains(12) {
                            genreValue.append(model)
                        }
                    }
                case .comedy:
                    value.forEach { model in
                        if model.genreIds.contains(35) {
                            genreValue.append(model)
                        }
                    }
                case .drama:
                    value.forEach { model in
                        if model.genreIds.contains(18) {
                            genreValue.append(model)
                        }
                    }
                case .family:
                    value.forEach { model in
                        if model.genreIds.contains(10751) {
                            genreValue.append(model)
                        }
                    }
                case .horror:
                    value.forEach { model in
                        if model.genreIds.contains(27) {
                            genreValue.append(model)
                        }
                    }
                case .romance:
                    value.forEach { model in
                        if model.genreIds.contains(10749) {
                            genreValue.append(model)
                        }
                    }
                case .thriller:
                    value.forEach { model in
                        if model.genreIds.contains(53) {
                            genreValue.append(model)
                        }
                    }
                case .scienceFiction:
                    value.forEach { model in
                        if model.genreIds.contains(878) {
                            genreValue.append(model)
                        }
                    }
                case .today:
                    genreValue = value
                case .thisWeek:
                    genreValue = value
                    
                }
                
                let useCasePosterModels: [MoviePosterModel] = genreValue.map { model -> MoviePosterModel in
                    let imageUrl = NetworkConstants.imagePath + model.imageUrl
                    return MoviePosterModel(
                        id: model.id,
                        imageUrl: imageUrl,
                        isSelected: false)
                }
                completion(.success(useCasePosterModels))
            }
        }
    }
    
}


