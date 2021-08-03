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
            let categoryRepo = MovieCategoryRepositoryModel(from: category),
            let subcategoryRepo = SubcategoryRepositoryModel(from: subcategory)
        else {
            return
        }
        
        networkDataSource.fetchMovies(category: categoryRepo, subcategory: subcategoryRepo) {
            (result: Result<[MovieDataSourceModel], Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let repositoryModels: [MovieRepositoryModel] = value.map { model -> MovieRepositoryModel in
                    let subcategories = model.subcategories.compactMap {
                        SubcategoryRepositoryModel(from: $0)
                    }
                    return MovieRepositoryModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description,
                        subcategories: subcategories)
                }
                completion(.success(repositoryModels))
            }
        }
    }
    
}
