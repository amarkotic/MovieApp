protocol MoviesNetworkDataSourceProtocol {
    
    func fetchMovies(
        categoryRepositoryModel: MovieCategoryRepositoryModel,
        subcategoryRepositoryModel: SubcategoryRepositoryModel,
        completion: @escaping (Result<[MovieDataSourceModel], Error>) -> Void
    ) 

    func fetchMovie(
        with id: Int,
        completion: @escaping (Result<MovieDetailsDataSourceModel, Error>) -> Void
    )
    
}
