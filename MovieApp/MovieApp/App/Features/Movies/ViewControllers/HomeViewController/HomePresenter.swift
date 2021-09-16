import UIKit
import Combine

class HomePresenter {

    private let moviesUseCase: MoviesUseCaseProtocol
    private let appRouter: AppRouter

    init(moviesUseCase: MoviesUseCaseProtocol, appRouter: AppRouter) {
        self.moviesUseCase = moviesUseCase
        self.appRouter = appRouter
    }

    func getSubcategories(for category: MovieCategoryViewModel) -> [SubcategoryViewModel] {
        switch category {
        case .popular, .topRated:
            return [.action, .adventure, .comedy, .drama, .family, .horror, .scienceFiction, .thriller]
        case .trending:
            return [.thisWeek, .today]
        }
    }

    func fetchMovies(
        category: MovieCategoryViewModel,
        subCategory: SubcategoryViewModel
    ) -> AnyPublisher<[MovieViewModel], Error> {
        let categoryModel = MovieCategoryModel(from: category)
        let subCategoryModel = SubcategoryModel(from: subCategory)

        return moviesUseCase.fetchMovies(
            categoryModel: categoryModel,
            subcategoryModel: subCategoryModel)
            .map { $0.map { MovieViewModel(from: $0)} }
            .receiveOnMain()
    }

    func showMovieDetails(with id: Int) {
        appRouter.showMovieDetails(with: id)
    }

    func updateFavoriteMovie(with model: MovieViewModel) {
        moviesUseCase
            .updateFavorites(with: MovieModel(from: model))
    }

    func goToSearch() {
        appRouter.goToSearch()
    }

}
