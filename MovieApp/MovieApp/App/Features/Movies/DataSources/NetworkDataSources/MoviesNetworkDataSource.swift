class MoviesNetworkDataSource: MoviesNetworkDataSourceProtocol {
    
    private let networkClient: MoviesNetworkClientProtocol
    
    init(networkClient: MoviesNetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) {
        guard
            let categoryDataSourceModel = MovieCategoryDataSourceModel(from: categoryRepositoryModel),
            let subcategoryDataSourceModel = SubcategoryDataSourceModel(from: subcategoryRepositoryModel)
        else {
            return
        }
        
        networkClient.getMovies(
            categoryDataSourceModel: categoryDataSourceModel,
            subcategoryDataSourceModel: subcategoryDataSourceModel
        ) {
            (result: Result<MoviesNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDataSourceModels: [MovieDataSourceModel] = value.results.map { model -> MovieDataSourceModel in
                    let subcategoryDataSourceModels = model.genreIds.compactMap {
                        SubcategoryDataSourceModel(rawValue: $0)
                    }
                    return MovieDataSourceModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description,
                        subcategories: subcategoryDataSourceModels)
                }
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
}
