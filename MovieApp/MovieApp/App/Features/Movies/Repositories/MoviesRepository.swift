class MoviesRepository: MoviesRepositoryProtocol {
    
    private let networkDataSource: MoviesNetworkDataSourceProtocol
    
    init(networkDataSource: MoviesNetworkDataSourceProtocol) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchMovies(
        categoryModel: MovieCategoryModel,
        subcategoryModel: SubcategoryModel,
        completion: @escaping (Result<[MovieRepositoryModel], Error>) -> Void
    ) {
        guard
            let categoryRepoModel = MovieCategoryRepositoryModel(from: categoryModel),
            let subcategoryRepoModel = SubcategoryRepositoryModel(from: subcategoryModel)
        else {
            return
        }
        
        networkDataSource.fetchMovies(
            categoryRepositoryModel: categoryRepoModel,
            subcategoryRepositoryModel: subcategoryRepoModel
        ) {
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
    
    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsRepositoryModel, Error>) -> Void
    ) {
        networkDataSource.fetchMovie(with: id) { [weak self]
            (result: Result<MovieDetailsDataSourceModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let movieDetailsRepositoryModels = MovieDetailsRepositoryModel(
                    from: value,
                    genres: self?.mapGenresToReposiroryModels(from: value.genres) ?? []
                )
                completion(.success(movieDetailsRepositoryModels))
            }
        }
    }
    
    private func mapGenresToReposiroryModels(from dataSourceModel: [GenresDataSourceModel]) -> [GenresRepositoryModel] {
        dataSourceModel.map { GenresRepositoryModel(from: $0) }
    }
    
}
