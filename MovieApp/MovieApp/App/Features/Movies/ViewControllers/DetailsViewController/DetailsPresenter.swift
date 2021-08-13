import UIKit

class DetailsPresenter {
<<<<<<< HEAD
    
    var appRouter: AppRouter!
    var movieUseCase: MoviesUseCaseProtocol!
    weak private var delegate: DetailsViewController?
    
    init(movieUseCase: MoviesUseCaseProtocol, router: AppRouter) {
        self.movieUseCase = movieUseCase
=======

    private let appRouter: AppRouter
    weak private var delegate: DetailsViewController?
    
    init(router: AppRouter) {
>>>>>>> develop
        self.appRouter = router
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
<<<<<<< HEAD
    func fetchData(with id: Int) {
        movieUseCase.fetchMovie(with: id) {
            (result: Result<MovieDetailsModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                var genres = String()
                value.genres.forEach {
                    genres.append($0.name)
                    genres.append(" ")
                }
                let viewModel = MovieDetailsViewModel(
                    info: MainInfoViewModel(
                        posterPath: value.posterPath,
                        progressPercentage: value.voteAverage,
                        movieName: value.title,
                        releaseDate: value.releaseDate,
                        language: value.language,
                        genres: genres,
                        duration: value.runtime),
                    overview: OverviewViewModel(
                        overview: value.overview)
                )
                self.delegate?.setMainInfoData(model: viewModel)
            }
        }
=======
    
    func fetchData() {
        delegate?.setData(model: MovieDetailsViewModel())
>>>>>>> develop
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
}
