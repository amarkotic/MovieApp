class MoviesNetworkDataSource: MoviesNetworkDataSourceProtocol {
    
    private let networkClient: MoviesNetworkClientProtocol
    
    init(networkClient: MoviesNetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchMovies(
        category: MovieCategoryRepositoryModel,
        subcategory: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) {
        guard
            let category = MovieCategoryDataSourceModel(from: category),
            let subcategory = SubcategoryDataSourceModel(from: subcategory)
        else {
            return
        }
        
        networkClient.getMovies(category: category, subcategory: subcategory) {
            (result: Result<MoviesNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDataSourceModels: [MovieDataSourceModel] = value.results.map { model -> MovieDataSourceModel in
                    return MovieDataSourceModel(
                        id: model.id,
                        imageUrl: model.imageUrl,
                        title: model.title,
                        description: model.description,
                        genreIds: model.genreIds)
                }
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
}
