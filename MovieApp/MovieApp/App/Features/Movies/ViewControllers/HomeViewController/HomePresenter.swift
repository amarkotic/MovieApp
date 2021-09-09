import UIKit
import Combine

class HomePresenter {

    private let moviesUseCase: MoviesUseCaseProtocol

    var appRouter: AppRouter!
    var categories: [MovieCategoryViewModel] = [.popular, .topRated, .trending]

    weak private var delegate: HomeViewController?

    init(moviesUseCase: MoviesUseCaseProtocol, router: AppRouter) {
        self.moviesUseCase = moviesUseCase
        self.appRouter = router
    }

    func setDelegate(delegate: HomeViewController?) {
        self.delegate = delegate
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
        moviesUseCase.fetchMovies(
            categoryModel: category,
            subcategoryModel: subCategory)
            .map { $0.map { MovieViewModel(from: $0)} }
            .receiveOnMain()
    }

    func showMovieDetails(with id: Int) {
        appRouter.showMovieDetails(with: id)
    }

    func updateFavoriteMovie(with id: Int) {
        moviesUseCase
            .updateFavorites(with: id)
    }

    func goToSearch() {
        appRouter.goToSearch()
    }

}
