import UIKit

class DetailsPresenter {
    
    var appRouter: AppRouter!
    var movieUseCase: MoviesUseCaseProtocol!
    var netclient: MoviesNetworkClientProtocol!
    weak private var delegate: DetailsViewController?
    
    init(movieUseCase: MoviesUseCaseProtocol, netClient: MoviesNetworkClientProtocol, router: AppRouter) {
        self.movieUseCase = movieUseCase
        self.netclient = netClient
        self.appRouter = router
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData(with id: Int) {
        movieUseCase.fetchMovie(with: id) {
            (result: Result<MovieDetailsModel, Error>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                
                var str = ""
                value.genres.forEach { model in
                    str.append(model.name)
                    str.append(" ")
                }
                
                
                let viewModel = MovieDetailsViewModel(
                    info: MainInfoViewModel(
                        posterPath: value.posterPath,
                        progressPercentage: value.voteAverage,
                        movieName: value.title,
                        releaseDate: value.releaseDate,
                        language: value.language,
                        genres: str,
                        duration: value.runtime),
                    overview: OverviewViewModel(
                        overview: value.overview)
                )
                self.delegate?.setMainInfoData(model: viewModel)
            }
        }
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
}
