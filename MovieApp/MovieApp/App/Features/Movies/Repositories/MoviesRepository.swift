class MoviesRepository: MoviesRepositoryProtocol {
    
    private let networkDataSource: MoviesNetworkDataSourceProtocol
    
    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(
        category: MovieCategoryModel,
        subcategory: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    ) {
        guard
            let category = MovieCategoryRepositoryModel(from: category),
            let subcategory = SubcategoryRepositoryModel(from: subcategory)
        else {
            return
        }
        
        networkDataSource.fetchMovies(category: category, subcategory: subcategory) {
            (result: Result<[MovieDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let repositoryModels: [MovieRepositoryModel] = value.map { model -> MovieRepositoryModel in
                    let genreIds = model.genreIds.map {
                        SubcategoryRepositoryModel(rawValue: $0.rawValue)!
                    }
                    return MovieRepositoryModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description,
                        genreIds: genreIds)
                }
                completion(.success(repositoryModels))
            }
        }
    }
    
}
