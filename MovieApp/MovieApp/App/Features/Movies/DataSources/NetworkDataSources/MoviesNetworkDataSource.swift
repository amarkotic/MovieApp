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
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsDataSourceModel, Error>) -> Void
    ) {
        networkClient.getMovie(with: id) { [weak self]
            (result: Result<MovieDetailsNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDataSourceModels = MovieDetailsDataSourceModel(
                    posterPath: value.posterPath,
                    voteAverage: value.voteAverage,
                    title: value.title,
                    releaseDate: value.releaseDate,
                    runtime: value.runtime,
                    language: value.language,
                    genres: self?.mapGenresToDataSourceModel(models: value.genres) ?? [],
                    overview: value.overview)
                completion(.success(movieDataSourceModels))
            }
        }
    }
    
    private func mapGenresToDataSourceModel(models: [GenresNetworkModel]) -> [GenresDataSourceModel] {
        models.map { GenresDataSourceModel(from: $0) }
    }
}
